Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B839C442B1C
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 06:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145025; cv=none; b=BanowPRm0E8f9thKB9qP0wB6rBWE5Gn8wVKBPTZ7YxqWzy8wA1JbNP5sTz7Im8LhUd72wrG+oLGMAThkHdc/204oW96qaHTMO5Ll9Ur911YHT3lidWtFNsBrw/56B5J739KlWHnE9fZ6YNToYHrEEnmk3vDw7S3Z9R8cSzImjFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145025; c=relaxed/simple;
	bh=Yqd8oIVHaIEfv/SOkHEA2x720xZ7lEJtuePJDxG9RE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgepblEPLSwpGXq/ofSBUDEdWin+txMAqCeJkilOvnVhut3ytAalO+j4thvyPJMiRjCU2qwMu/poa/rUGQnVrJ5Ioibd9PclblPGhu/EFsPwW3ZJlRD4Cl4G9pQLpQ2n6xt++RVXalhlxGAge40EBJidj1CytIo/noOoCGFnlXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdI8j+fz; arc=none smtp.client-ip=74.125.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdI8j+fz"
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-32b2e778709so355971eec.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 23:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790145016; x=1790749816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/htKEf0dBalXpL7CXg4i5HUtCUFjzPRqjVlUe6Cxa4=;
        b=CdI8j+fzdRy4rpuBqpJrzk/vBF1p4uXjoJRzN+2lD6An0QrVvsCzrL7A+PYqn3IqLW
         jjfCVxxcEYEIfLceEfvZrQAKaL+dS+H9PwNNSgUDsv0Aslr4XIfWg6RQHr+rZjMOd0dj
         ONhxHyYJS4eTZZsZ6RUNMyqnNadv1GoW8mcCb8nHqRk2SHUdR2bFXjkIKXxeiXt0xOry
         IybBgcmp+2QbWQMVtBUWnoeHsJy76HP+IkM/j10IS8fhbXQrO0vUuzb4HgvdjFR1VMz7
         VlTxYjeGIIZ05HS0j7T9lOffBD08AGFaBI9jwzCNLIuGdhWze/YXSkAj5Q7WWJabJ4xE
         B+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790145016; x=1790749816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/htKEf0dBalXpL7CXg4i5HUtCUFjzPRqjVlUe6Cxa4=;
        b=X8sntkYtCFk/8MOYoWD2fAQhbmsk2TTjqZpdK688mr39D2xORtqtTPmuEpmjbOZJ0K
         3a/0YuraghKk8YzkDvRMgZQdKbi5Ul9oHzpksO0SHU8Rd8dWESRU4j8Puah1z7czajre
         gpAkI78vxZ1vDsK0n8k1Q/NnQ7KnqFzj3dw7VTyC5Nm0gfVx9DmiBZ7eqEhuqN3MDSdx
         2r8TPTwi5JWIYTxq52vsqrTcAL0QO9LnJ8zVRcIadmE+wm4iuqFZ7XCd02rXMlblK6ae
         tkDgL8bP5VqunuH4BDyq6qVRLADVL2MnwMnrI3TDw4U5Kc47ZL1D+jPWGWsSbutXN3Et
         WV0w==
X-Gm-Message-State: AFuF++kLrF2owmcHcsXbZiP3IEO6p6dtSIlsFkZXVi7aPjBFkw6oTpej
	n92tYAkAIqzSCd24PHx9Isb2I10gk5bpinnPStzb6vwkIptpbIYIgAgBCW+NhGyjUaO//w==
X-Gm-Gg: AYBFou2c/GFn2qbWsXpyypGf0ZBXKjAzC6Y5hajUSYZ81NE1/51qypWbxYNQ/dugysn
	I6Y1bW/nzFII9LpBwUmY8rGACfFYs4GhWwtZGrBzb8BUGRHdVib7bJBmtPimjNVnAam8IueGmZw
	34ewVQbJ19M1cYOXtxJDOQy5c8zmRTQyoq0FtZ7/1+Ywy/SDXh1t2yAPUseyP2Ta7AxFL6YmfFF
	ScQY/Ir3CyUY4gU2nPUNUMtljRoVZC8AOUxBdRLbJ83THQ9VLBWPU8jIYlp7yGIim60Z/9fkMRv
	snCbQBRfp0DpQVFDRuSx6IVg6jFwEZVXOfB5ujTJBzfXK8IKObSrLVgDTOV14S8qo7qCnEBOGl8
	x1dHYRg3PEvfIFZxG8d87wWYTySdaJqc5CR4BrJgktElu4hGMXNEI4rcM56cViEmdTqlNYfcscT
	kreOR6Sy1IqiEj+rHknnboWUWFOzRJilXhBnqfvNVo3Hee3Pt1Vz1xuZFeZdvXglFkboEaL8GIE
	nP+0WNVhNfWW63b7IvtqWiSuGLpW6R+Xy1S9TNm3BEpDDAylUzd
X-Received: by 2002:a05:7022:6298:b0:143:8829:5fb9 with SMTP id a92af1059eb24-144f91442fcmr2825829c88.16.1790145015911;
        Tue, 22 Sep 2026 23:30:15 -0700 (PDT)
Received: from Raccoon ([113.30.177.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm4838375c88.6.2026.09.22.23.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:30:15 -0700 (PDT)
From: Rohinthan P <rokinthanp03@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+ccc9a7cb39fa1af827ea@syzkaller.appspotmail.com,
	Rohinthan P <rokinthanp03@gmail.com>
Subject: [PATCH] usb: storage: alauda: check return value of alauda_ensure_map_for_zone()
Date: Wed, 23 Sep 2026 12:00:08 +0530
Message-ID: <20260923063008.19570-1-rokinthanp03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In alauda_read_data() and alauda_write_lba(), the driver calls
alauda_ensure_map_for_zone() to initialize the LBA-to-PBA block mapping
for a zone before accessing MEDIA_INFO(us).lba_to_pba[zone][lba_offset].

However, alauda_ensure_map_for_zone() returns void and ignores the
return value of alauda_read_map(). If reading the block map fails (e.g.
due to I/O error or device disconnection),
MEDIA_INFO(us).lba_to_pba[zone] remains NULL. The caller then
dereferences MEDIA_INFO(us).lba_to_pba[zone], causing a general
protection fault / NULL pointer dereference:

    Oops: general protection fault
    KASAN: null-ptr-deref in range
    [0x0000000000000000-0x0000000000000007]
    RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:972

In addition, alauda_read_data() checked lba >= max_lba after calling
alauda_ensure_map_for_zone(), which could compute an out-of-bounds zone
index.

Make alauda_ensure_map_for_zone() return an error code and verify that
the zone mapping pointers are non-NULL. Check its return value in both
alauda_read_data() and alauda_write_lba(), and move the capacity
overflow check in alauda_read_data() before calling
alauda_ensure_map_for_zone().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+ccc9a7cb39fa1af827ea@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ccc9a7cb39fa1af827ea
Signed-off-by: Rohinthan P <rokinthanp03@gmail.com>
---
 drivers/usb/storage/alauda.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
index 691fe47..da4964e 100644
--- a/drivers/usb/storage/alauda.c
+++ b/drivers/usb/storage/alauda.c
@@ -689,11 +689,25 @@ static int alauda_read_map(struct us_data *us, unsigned int zone)
  * Checks to see whether we have already mapped a certain zone
  * If we haven't, the map is generated
  */
-static void alauda_ensure_map_for_zone(struct us_data *us, unsigned int zone)
+static int alauda_ensure_map_for_zone(struct us_data *us, unsigned int zone)
 {
+	int rc = USB_STOR_TRANSPORT_GOOD;
+
+	if (!MEDIA_INFO(us).lba_to_pba || !MEDIA_INFO(us).pba_to_lba)
+		return USB_STOR_TRANSPORT_ERROR;
+
+	if (MEDIA_INFO(us).lba_to_pba[zone] == NULL
+		|| MEDIA_INFO(us).pba_to_lba[zone] == NULL) {
+		rc = alauda_read_map(us, zone);
+		if (rc != USB_STOR_TRANSPORT_GOOD)
+			return rc;
+	}
+
 	if (MEDIA_INFO(us).lba_to_pba[zone] == NULL
 		|| MEDIA_INFO(us).pba_to_lba[zone] == NULL)
-		alauda_read_map(us, zone);
+		return USB_STOR_TRANSPORT_ERROR;
+
+	return USB_STOR_TRANSPORT_GOOD;
 }
 
 /*
@@ -823,7 +837,9 @@ static int alauda_write_lba(struct us_data *us, u16 lba,
 	unsigned int new_pba_offset;
 	unsigned int zone = lba / uzonesize;
 
-	alauda_ensure_map_for_zone(us, zone);
+	result = alauda_ensure_map_for_zone(us, zone);
+	if (result != USB_STOR_TRANSPORT_GOOD)
+		return result;
 
 	pba = MEDIA_INFO(us).lba_to_pba[zone][lba_offset];
 	if (pba == 1) {
@@ -954,8 +970,6 @@ static int alauda_read_data(struct us_data *us, unsigned long address,
 		unsigned int lba_offset = lba - (zone * uzonesize);
 		unsigned int pages;
 		u16 pba;
-		alauda_ensure_map_for_zone(us, zone);
-
 		/* Not overflowing capacity? */
 		if (lba >= max_lba) {
 			usb_stor_dbg(us, "Error: Requested lba %u exceeds maximum %u\n",
@@ -964,6 +978,10 @@ static int alauda_read_data(struct us_data *us, unsigned long address,
 			break;
 		}
 
+		result = alauda_ensure_map_for_zone(us, zone);
+		if (result != USB_STOR_TRANSPORT_GOOD)
+			break;
+
 		/* Find number of pages we can read in this block */
 		pages = min(sectors, blocksize - page);
 		len = pages << pageshift;
-- 
2.53.0

