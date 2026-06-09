Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F063F210B
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996835; cv=none; b=S3FCq7x8rpr1Z8QLFV1X2/xKWrpS9IcMND/hdhU54XdW/5qHsatuQt7cXIPQOgNcLzOVwPV45E6GYKHXigp/qm62RGveMgcyobeMGo1mHPVueBGVVhOMtDEbQfXgukzoon6ZJYL3a8pcVJ0SNfGUSragfiRUu3fPsC51R2Kg2xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996835; c=relaxed/simple;
	bh=pU9B/QqH7g8VzGyxf9sPM2ZUWtMbP1hNwo1eA2PBGio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ufy9q1j2PWJq2U5WSjPhGfcNY38adxvFHm6PjV7MI9bYON5CRCoExQ2xw8ScaKGsJt8H5iH9MB11Ky1xr35q9W7vMYAQ4sj19C7AIatyavky5kkFzvC8tewVFJABlMZOzQ9SoqF5g91KzbuzBfMZ+fdTGbirwzTU1V6U5Ww6UnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=C1+mJs5y; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="C1+mJs5y"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=C1+mJs5y5I0CSy5BBWRkmqSi4OoTM1S3c3ZIVdqnYFs2P9VXKobZ6a8K332U9ejnBoSu+LdcWAf9UFY90k4dH+n0IQzeY8JvbCYiGShXOXeAN/d7+GWX3LR2hshCOglmXU520D2xQ0UvqsIQKxaydR86/Ehxcs3B+mrbIDnOzXdxYu5X+hT1uqwjVq1JKX0KAY2CbULcqgewxuFjtvSXVpwWfwLxt3UfvH6dErWR88Wnhsb+MdNGJZILFxn+FkItj8Q+FsWrwWq6hgrm+RLFh6c4jT5R20qA2aMGVKDYe5hjXk+BioLjsXBbQ1AaAavFRUJ8TqxDGPHh22aXJmNnMg==; s=purelymail2; d=purelymail.com; v=1; bh=pU9B/QqH7g8VzGyxf9sPM2ZUWtMbP1hNwo1eA2PBGio=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 339864016;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 09 Jun 2026 09:20:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1wWsdB-0000000BOpj-21dM;
	Tue, 09 Jun 2026 11:20:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: linux-usb@vger.kernel.org,
	julian@jusst.de,
	gregkh@linuxfoundation.org,
	Pavel Hofman <pavel.hofman@ivitera.com>
Cc: Peter Korsgaard <peter@korsgaard.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] usb: gadget: f_uac1: fix memory leak in UAC1_RATE_ATTRIBUTE store
Date: Tue,  9 Jun 2026 11:19:56 +0200
Message-ID: <20260609091957.2716984-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609091957.2716984-1-peter@korsgaard.com>
References: <20260609091957.2716984-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

strsep() clobbers the passed pointer, so we need a separate variable to be
able to correctly kfree() the memory at the end.

Fixes: 695d39ffc2b5 ("usb: gadget: f_uac1: Support multiple sampling rates"=
)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 drivers/usb/gadget/function/f_uac1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/func=
tion/f_uac1.c
index 85c502e98f577..5cd63e590f553 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1594,7 +1594,7 @@ static ssize_t f_uac1_opts_##name##_store(struct conf=
ig_item *item,=09\
 =09=09=09=09=09  const char *page, size_t len)=09\
 {=09=09=09=09=09=09=09=09=09\
 =09struct f_uac1_opts *opts =3D to_f_uac1_opts(item);=09=09\
-=09char *split_page =3D NULL;=09=09=09=09=09\
+=09char *p, *split_page =3D NULL;=09=09=09=09=09\
 =09int ret =3D -EINVAL;=09=09=09=09=09=09\
 =09char *token;=09=09=09=09=09=09=09\
 =09u32 num;=09=09=09=09=09=09=09\
@@ -1608,8 +1608,8 @@ static ssize_t f_uac1_opts_##name##_store(struct conf=
ig_item *item,=09\
 =09=09=09=09=09=09=09=09=09\
 =09i =3D 0;=09=09=09=09=09=09=09=09\
 =09memset(opts->name##s, 0x00, sizeof(opts->name##s));=09=09\
-=09split_page =3D kstrdup(page, GFP_KERNEL);=09=09=09=09\
-=09while ((token =3D strsep(&split_page, ",")) !=3D NULL) {=09=09\
+=09split_page =3D p =3D kstrdup(page, GFP_KERNEL);=09=09=09\
+=09while ((token =3D strsep(&p, ",")) !=3D NULL) {=09=09=09\
 =09=09ret =3D kstrtou32(token, 0, &num);=09=09=09\
 =09=09if (ret)=09=09=09=09=09=09\
 =09=09=09goto end;=09=09=09=09=09\
--=20
2.47.3

