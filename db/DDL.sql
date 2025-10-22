-- ===============================
-- TABLA: tech_test_posts
-- ===============================
CREATE SCHEMA IF NOT EXISTS order_api ;

CREATE TABLE IF NOT EXISTS order_api.tech_test_posts
(
    id BIGSERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    slug VARCHAR(100) NULL,
    body TEXT,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

 
-- ===============================
-- TABLA: tech_test_comments
-- ===============================

CREATE TABLE IF NOT EXISTS order_api.tech_test_comments
(
    id BIGSERIAL PRIMARY KEY,
    "post_id" BIGINT NOT NULL,
    comment TEXT NOT NULL,
    "apiResponse" TEXT,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_post
        FOREIGN KEY("post_id")
        REFERENCES order_api.tech_test_posts(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

 

-- ===============================
-- FUNCIÓN para mantener updatedAt actualizado
-- ===============================

CREATE OR REPLACE FUNCTION order_api.set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW."updatedAt" = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- ===============================
-- TRIGGERS
-- ===============================

-- Para tech_test_posts

DROP TRIGGER IF EXISTS trg_set_updated_at_posts ON order_api.tech_test_posts;
CREATE TRIGGER trg_set_updated_at_posts
BEFORE UPDATE ON order_api.tech_test_posts
FOR EACH ROW
EXECUTE FUNCTION order_api.set_updated_at();

-- Para tech_test_comments

DROP TRIGGER IF EXISTS trg_set_updated_at_comments ON order_api.tech_test_comments;
CREATE TRIGGER trg_set_updated_at_comments
BEFORE UPDATE ON order_api.tech_test_comments
FOR EACH ROW
EXECUTE FUNCTION order_api.set_updated_at();

 