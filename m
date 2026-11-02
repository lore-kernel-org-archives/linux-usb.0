Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=71.18.227.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633001;
	b=ROIaWDLWa5Hka6jZJN1CgIESVABYRvjMuL8FvF390cKjduoAA+PnA6MPdiypv/ePEmsK
	 xep+UguIrDpNbFlBolwqIThdLQUg99AZRHMiRZRwPISNt2wRHjZG9bPojtMHan4q0+j4P
	 kfl9ypPEwtxTNP7OgPM5EctbLb8lhPH5JXQF3hMf/NPhzzCRgUl5L/7Ym3ELngielsYrv
	 SAqeL0NT5QQDCGPFCyvJHr6kr+sY+UnL2T4BECNAe5S34W/rKfpJ8P0lP3EVdTJ2JLZrI
	 PoymZfaPuCVPjhnY+5JOs0+YyY2rwKYM0GHBjwcIJ+Wrxcs/7Ndcw7/wNEryF8nOFtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633001;
	h=DMARC-Filter:DKIM-Signature:Content-Type:To:From:Subject:Message-Id:
	 Mime-Version:X-Original-From:X-Lms-Return-Path:X-B4-Tracking:Cc:Date:
	 Received:Content-Transfer-Encoding:X-Mailer:X-Change-Id;
	bh=guPZvxLd6vY90xPInQ08JAkLKvg/HCQkXV27YDibAYk=;
	b=S9ML4qxxUrODOr7cbo1RAjoeVfDvnH/uJEKn9tri9GBSZriFX1NdUQt2ehuzdzHf/EHK
	 v5zQVXhkrycOesYTbKE1No1OuZvia5DNXfMjOKidGXiHgEXXzyEVXaynLTTpBiNSR8tLY
	 c3a6ZgV1jDclYF2gHf84tzCkASCKFU9kLAgoO+wbkYe7EidUNJWAAEWfeX3uWm9Nd+yvy
	 P4dgb+OTwSiaI+YtVP89W0AsjMMQK3gv2fymaT/hxk2YKmZhv2UO6t81CAk8xrmzzxkky
	 KSOG3Zek7fTXKxhwVqYbHxYHeIpDLxMHIlNnn60/e3Ez3KU0G6UtU4Cv5wBpVP8W3Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherr.cc;
	spf=pass smtp.mailfrom=cherr.cc;
	dkim=pass header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=jIBlJPg6;
	arc=none smtp.remote-ip=71.18.227.5
Received: from sg-2-5.ptr.blmpb.com (sg-2-5.ptr.blmpb.com [71.18.227.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1FF60A6EFF
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 15:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1FF60A6EFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=jIBlJPg6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1793632994; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=guPZvxLd6vY90xPInQ08JAkLKvg/HCQkXV27YDibAYk=;
 b=jIBlJPg68+S19w6K78CKfhTx1Bc6Oh3IhTAOVAUM6UgTTsjhcHe8jaP24ir3SvriymBxZe
 zsAA2PKmgUsjiTFd/EPJVWru5uAVDa1mZrDj8GuTU6rdkP25V8ycfIVsle1YwBV/AxPL2b
 mSt8AyGqulhhZHNlqDvMQ7n9fhy9qEawGiK1a1vdD022ZBGA0Qdq0Q4mvz/OCefihPZGHi
 7QyFAOyGe5lw+1Cx1D3E8NJb3VkNtQV10eDPkoMjNofBadkljpRS0GBtAC+x0Bffz2NFx1
 Zo5lzG1Gw/Jm3kbc0SSF9w4eGwTzgkyFgXGgjfX7wT0AUAzg9MVMroObPFCB+w==
Content-Type: text/plain; charset=UTF-8
To: =?utf-8?q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>, 
	"Oleg Makarenko" <oleg@makarenk.ooo>, "Jiri Kosina" <jikos@kernel.org>, 
	"Benjamin Tissoires" <bentiss@kernel.org>, 
	=?utf-8?q?Micha=C5=82_Kope=C4=87?= <michal@nozomi.space>, 
	"Paul Dino Jones" <paul@spacefreak18.xyz>
From: "Shengzhuo Wei" <me@cherr.cc>
Subject: [PATCH v2] HID: pidff: bound the unit exponent rescaling loop
Message-Id: <20261102-b4-pidff-rescale-exponent-v2-1-a75bcca65fd0@cherr.cc>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Shengzhuo Wei <me@cherr.cc>
X-Lms-Return-Path: <lba+26ae8aae0+3d8e8a+vger.kernel.org+me@cherr.cc>
X-B4-Tracking: v=1; b=H4sIANuq6GoC/yXMQQrCMBBG4auUWTvQDLUUryIu2uSPjkgaMq0US u9u1OW3eG8nQ1EYXZqdCt5qOqcKOTXkH2O6gzVUk7TSu1YGnjrOGmLkAvPjC4wtzwlpYRfOvoO 4AX2g2ueCqNvvfb39bev0hF++QzqOD8/8BhF9AAAA
Cc: <linux-input@vger.kernel.org>, <linux-usb@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
Date: Mon, 02 Nov 2026 23:23:08 +0800
Received: from [127.0.1.1] ([111.42.148.29]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 23:23:12 +0800
Content-Transfer-Encoding: quoted-printable
X-Mailer: b4 0.16.0
X-Change-Id: 20261028-b4-pidff-rescale-exponent-1d5c4e218e6d

pidff_rescale_time() walks the device-provided unit exponent one step
at a time, allowing extreme values to cause billions of iterations
while ff->mutex is held. In a UHID test with an INT_MIN exponent,
EVIOCSFF took 3.1 to 4.3 seconds to upload a finite-duration effect.

Stop rescaling once scaled_time becomes zero, since further
multiplication or division by 10 cannot change the result. The u32
value becomes zero within 32 multiplications by 10, and the u16
input within 5 divisions. This bounds the loops while preserving
their results for all exponents, including wraparound.

Also warn during initialization if the duration field's unit exponent
is outside the range -8 to 0. This helps identify unusual device
descriptors without logging on every effect upload or changing the
rescaling result.

Fixes: 8713107221a8 ("HID: pidff: Rescale time values to match field units"=
)
Reviewed-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
---
v1: https://lore.kernel.org/r/20261029-b4-pidff-rescale-exponent-v1-1-3ba54=
accf767@cherr.cc

Changes in v2:
- Following Tomasz's suggestion, warn during initialization when
  the duration field's unit exponent is outside -8..0.
- Add Tomasz's Reviewed-by.
---
 drivers/hid/usbhid/hid-pidff.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.=
c
index 22951b7ecd17..4540f49fe6e3 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -354,9 +354,9 @@ static u32 pidff_rescale_time(u16 time, struct hid_fiel=
d *field)
 	int exponent =3D field->unit_exponent;
=20
 	pr_debug("time field exponent: %d\n", exponent);
-	for (; exponent < FF_TIME_EXPONENT; exponent++)
+	for (; scaled_time && exponent < FF_TIME_EXPONENT; exponent++)
 		scaled_time *=3D 10;
-	for (; exponent > FF_TIME_EXPONENT; exponent--)
+	for (; scaled_time && exponent > FF_TIME_EXPONENT; exponent--)
 		scaled_time /=3D 10;
=20
 	pr_debug("time calculated from %d to %d\n", time, scaled_time);
@@ -1428,11 +1428,19 @@ static int pidff_find_effects(struct pidff_device *=
pidff,
  */
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev =
*dev)
 {
+	int exp;
+
 	if (PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1)) {
 		hid_err(pidff->hid, "unknown set_effect report layout\n");
 		return -ENODEV;
 	}
=20
+	exp =3D pidff->set_effect[PID_DURATION].field->unit_exponent;
+	if (exp < -8 || exp > 0)
+		hid_warn(pidff->hid,
+			 "duration field has unusual time unit exponent %d\n",
+			 exp);
+
 	PIDFF_FIND_FIELDS(block_load, PID_BLOCK_LOAD, 0);
 	if (!pidff->block_load[PID_EFFECT_BLOCK_INDEX].value) {
 		hid_err(pidff->hid, "unknown pid_block_load report layout\n");

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261028-b4-pidff-rescale-exponent-1d5c4e218e6d

Best regards,
-- =20
Shengzhuo Wei <me@cherr.cc>
