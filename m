Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F3392C3C
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 18:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.189.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788028694; cv=none; b=LHBlNELa0S/MUNeSafzVp2BkFwJUAmcg2UoI3uBSII2GeyQfVVkq/iirbkWsz8+bVNlDniwS+tzW1edvrGwKJcXNkpC8uel7NqU6xAKr+FTMCiHqXcrNwaftqm3w+88rILadJsC/WRSHnV3Bq+N5Eiqj9yI7X8vQIDBwHDAdkQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788028694; c=relaxed/simple;
	bh=xBSv/qQ9FjZCVlZPThp+Et3CPFrgcsoFPPHw4wtOLl8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=bj6bN+Zuic/mSa1+GUZpGUAJObm270tJHvB8gdf7ANcQOAETluoeqnN710cMALBJXpjf8rceLyfwlstVf33POfj2/CW9No0n+MEPuAy1aIdhXQjtunQiA+dHNdce8C0aMJzWFY2bmcP/fpGes5i0Zx1eluo4yg4J/polmcOA/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org; spf=pass smtp.mailfrom=archlinux.org; dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=KLoYpFzZ; dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=/1Qa3ana; arc=none smtp.client-ip=95.216.189.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="KLoYpFzZ";
	dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="/1Qa3ana"
Message-ID: <6323ed34-7954-4f0b-b6c5-8e1b1ffc1648@archlinux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1788028686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=joZCcZEs48f7CYGxgYYW0PxesNPDYUGdpI00AtKUKFk=;
	b=KLoYpFzZSLeF0QKRF2pqU37rtdEEsRYbafun2T0zPwdrijDNaaLf2ZL8yruC+exqnbYb6B
	mJUk8ngaqHXNMFGqX9szO9gtpVAQCTOqGhvO3fM+yCxOFHVgzSHUzkb4+EJt9N69fguALp
	JSAiGcTj3fDzRmD5euFOK1Y6Mp6e9MVU3G76RNVrQft4m//1PX6yPSg7yC4MJ7OJlfh7zw
	Xxk+t8pGkEuTuN0qy/mOvB3PWeOknh14pbc4O1NmZgy4dAvl5ZflrB72SfWqq6sV60q6SE
	B5xPjCVfN8BqRMrPfRU/RXoUYEWHNC6UbM7dnfP4osrbk5Ya8IQNLrk9/hGUjH3ob79+po
	KWzl6e0Le6rKDj7bkSiijKmM2+vLg0hLh3DxlevgkqNfoezeDJ3HNNeEFTP3CVlIqQxrBi
	oEoLVynWrW/mAUU81P3HbasxoCe2NJ2iznpALnmN1dJFDm/Y+dQeoWIO3aOGn0XzQIktmU
	TwsfIb+2hh6DY3GVaFFR+LQeXa3k4H5OnPoWs5slzACTpYiwPlJfIlTHDYcT9nuuZ58WtO
	dgNb/umLGsvPGfiwPUwN/ZZ8ON1YqJVPSf9xa6NQpjUCzS4HEonoi3JV/k/aBwL2X77vFL
	8ufQtODr3V9BcQOApaGGv9RhmNOqrEfDzyaMT3BQddXtGdG6WZAGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1788028686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=joZCcZEs48f7CYGxgYYW0PxesNPDYUGdpI00AtKUKFk=;
	b=/1Qa3anaaripbpBaNGdv6iJEVBUP7nhuJ+i5faGBibG6BsWsr4eu0UI54ye/hZw2tVZM93
	JTrzEUyfy0ry0GDA==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=martin smtp.mailfrom=martin@archlinux.org
Date: Sat, 29 Aug 2026 20:38:04 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: linux-usb@vger.kernel.org
From: Martin Rys <martin@archlinux.org>
Subject: [PATCH v2] USB: Improve "New device found" printout message
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From c5b92273e0b7e2f095cab876603d37a1f4530175 Mon Sep 17 00:00:00 2001
From: Martin Rys <martin@archlinux.org>
Date: Sat, 29 Aug 2026 20:26:44 +0200
Subject: [PATCH v2] USB: Improve "New device found" printout message

Use a colon instead of a comma, like the debug message after this one does.

Do not print a space after `bcdDevice=` - this was introduced as the formatting was copied from `lsusb -v` printout, but lsusb output has preceding spaces, this message does not, so it ends up looking odd.

Previously the output ended up looking like `idProduct=a000, bcdDevice= 1.00` if the first hex character of bcdDevice was 0.

Signed-off-by: Martin Rys <martin@archlinux.org>
---
v1 -> v2: No code changes, only amended commit message and hopefully sending it proper now.

 drivers/usb/core/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..c382215a1177 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2411,7 +2411,7 @@ static void announce_device_ids(struct usb_device *udev)
 	u16 bcdDevice = le16_to_cpu(udev->descriptor.bcdDevice);

 	dev_info(&udev->dev,
-		"New USB device found, idVendor=%04x, idProduct=%04x, bcdDevice=%2x.%02x\n",
+		"New USB device found: idVendor=%04x, idProduct=%04x, bcdDevice=%x.%02x\n",
 		le16_to_cpu(udev->descriptor.idVendor),
 		le16_to_cpu(udev->descriptor.idProduct),
 		bcdDevice >> 8, bcdDevice & 0xff);
--
2.55.0
