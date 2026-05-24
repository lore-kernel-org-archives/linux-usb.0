Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE83A397AFF;
	Sun, 24 May 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628017; cv=none; b=KFuK7WygXwzL5tpxcModWp4H9p0VEsZqSM704F2qqIGDthWkjkHEoQgsX7VcxVIh/vI8P6QhdJpY9t/nD6tox+ZnEGJystxJWGi12FnUI3mPgRgJ98a/Qnb/vwUgVLkbLZn5yd8Cx8NhieNuE67FRf9vLJX1D0CBdgyIMOBHI9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628017; c=relaxed/simple;
	bh=MhWwgbCd/dj7nPgAVmyCoPCA1SbmNeM1KIHvSVdPcMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MAX/ZicY8ajkItr7NkPlTtq3hdEUUjAIVUqwOn+Cc43HLD4r7Won0YRKj6s0klR1/tahmxIHyxrANdzQzkyBygYzFmgKBLRiOAnMT4E9UFt577tU48ZYHvk/F7A+xy2OL1/gXSdHzwqb09Rc2kNIFvMIc2dcJowg5cpJ4N++Xc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=aUp9cGzn; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="aUp9cGzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779628008;
	bh=MhWwgbCd/dj7nPgAVmyCoPCA1SbmNeM1KIHvSVdPcMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aUp9cGzn6tuYg9/a7jR4pTAXFGO01PxDevNNlcwxgXcTAHiMLlg3ApXq0XZ519sPd
	 FwwADB/Z/nAG7ev4QGjy5mB6V17vbrvF9FsbuQQNlKVSU6pWduuJwA2cbu58I8EGtm
	 ymWDxoSZKyUv10PPRX2mI6izSdkRhHGQJLrGUuVY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 24 May 2026 15:06:48 +0200
Subject: [PATCH 6/6] thunderbolt: property: Make entry key modifications
 more visible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260524-thunderbolt-big-endian-v1-6-6044edca78e7@weissschuh.net>
References: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
In-Reply-To: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Michael Jamet <michael.jamet@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yehezkel Bernat <yehezkel.bernat@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779628007; l=1380;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=MhWwgbCd/dj7nPgAVmyCoPCA1SbmNeM1KIHvSVdPcMs=;
 b=Bcmo0SrjhNjoQek8kEnjHNEeWYSt+3jkrR0X1uXROsQhRw/MU91kz2UfBkFekXmqhiZCpiBcn
 7vme2RTtFGCB8Lt0o8lgyj1igXoIqelFe8gwTpffM1HyVYaQXf9xpWy
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The modification of the key directly through the entry pointer is
confusing. Explicitly use the key member.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/thunderbolt/property.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index 961efcec1795..885a8da7e72f 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -15,8 +15,7 @@
 #include <linux/thunderbolt.h>
 
 struct tb_property_entry {
-	__le32 key_hi;
-	__le32 key_lo;
+	u8 key[TB_PROPERTY_KEY_SIZE];
 	__le16 length;
 	u8 reserved;
 	u8 type;
@@ -105,7 +104,7 @@ static struct tb_property *tb_property_parse(const u32 *block, size_t block_len,
 	if (!tb_property_entry_valid(entry, block_len))
 		return NULL;
 
-	convert_dwdata(key, entry, 2);
+	convert_dwdata(key, &entry->key, 2);
 	key[TB_PROPERTY_KEY_SIZE] = '\0';
 
 	property = tb_property_alloc(key, entry->type);
@@ -447,7 +446,7 @@ static ssize_t __tb_property_format_dir(const struct tb_property_dir *dir,
 	list_for_each_entry(property, &dir->properties, list) {
 		const struct tb_property_dir *child;
 
-		convert_dwdata(entry, property->key, 2);
+		convert_dwdata(&entry->key, property->key, 2);
 		entry->type = property->type;
 
 		switch (property->type) {

-- 
2.54.0

