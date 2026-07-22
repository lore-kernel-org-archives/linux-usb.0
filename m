Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C54C46EF99;
	Wed, 22 Jul 2026 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708271; cv=none; b=I4LCTt0Q5+VekBQ5YXO4QbCrDhX0aeLmSx9MjdJK79tYRGB94QzwVWjwq0k4VgPyx3CCGFi84B+w00CGCxk52hYHrc83r2HKjbXOaUp9lM/0CpEMpWS24hgh7rsi/9UBBAhuyAqUlo/QrSnGvJxbNRXkolAxTwSiPKo/gwOZOUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708271; c=relaxed/simple;
	bh=eF2ME2ttEZb0VIdKYcWF8muPJEpju5lW216COc1+Cks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+/O30Md0kcPoNEwC4wFykS6snnVdhcblJ3WtP4GZ9UuL+yuXrum9i6DDEc++Ix5aHxUqmkSD3wMNG2Rw1R3e7CbEVczM6HURz4KyHyQjHOBxPSjshdYEIFp7s5YAmSzNdLeijWIleFggkiaCE0aPlgfasTpzEKLyFiA9FnMwLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=fZrD5bzp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o+BmCcO+; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="fZrD5bzp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o+BmCcO+"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8DAB3140008C;
	Wed, 22 Jul 2026 04:17:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 22 Jul 2026 04:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784708269;
	 x=1784794669; bh=Vs0KPczryWdKAcCv6YyH/7ZuSGKJ4VjjMj8QX68N7Yg=; b=
	fZrD5bzp+uoXeoKxLUg2AjOHou6mcr43EWY6yB+x+dd4xp2+OxVi1ShoLX1RSQ6S
	Vl2NvmOiv3CVpVjN94WJ0jekV8R0bUQlHMwE8Wswhbgm5LnMmMOIKxgdhUy/KH2V
	cWiYCA2buvfwUYZC06xKQDnCAzbpxDj58RBvoILKyPr19bKR4uUy4yKh3SLs54yh
	L9Fk9CQaeuVbO79yyHCveMTGFLd/3S4bas4MCxifzEwYPy3PqxM0u23L8PjHt6+U
	ejvOphyGPXrxbL4HUkbwOo0SPB530ovaJKYHpvRdD/hRDLH57sj02n1KyDaesVds
	0riLOVOUfUA8kPX8bpPiEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784708269; x=
	1784794669; bh=Vs0KPczryWdKAcCv6YyH/7ZuSGKJ4VjjMj8QX68N7Yg=; b=o
	+BmCcO+ZKoOSBko4S9PF2h9uEhfomFbG0QbxHjnHx3qf7DLdEeYirnQkuRUNbjA0
	GlIRISwc4OfsvE+SQkxUfr7ryMy7oRwJMNuds6yDq3Ec6NfmhZn8xEkEIqxVh5XC
	xhfv0PGiJCROb67oh/fksegjBPLg0RSgGb6InkpORjVeT0ibQJUrO5JFOYmP6m7f
	O55bufsj/W33Sq+GPOm80RvKZIFvFRWwNptfbsKa7Zq3eGbh/UCVzhhFb6ferlKm
	oGBZgKS5A8UzWrOGqNSNjGBAOHaTo9/RL6M8g8u3+GB+h2vWlI/Sd2WvFM5cF1mB
	LNbanzxuAWoiR3MQGF7bQ==
X-ME-Sender: <xms:rXxgamjwFi174NT3pl4-xhvVgB1kkwMOXukI8vlkEq81ywOymV0Ceg>
    <xme:rXxgak3awXc0vxFJ3b-exoDhJLHCeZa0UL5KaxXhR8GwE3vzOtjDy3VIVT60OR72V
    QorqDtzjgSms6jj0bIqhwkor7oVXIioQkKoEvyTXKWtiI0wBKA>
X-ME-Received: <xmr:rXxgaohW6NkFkAGs_0WRa_15tENxAyHb6_VbP5DdF5tyBa5g_nWEWAIEiGppDaMBVp4CP88tKf660hQSma0-6uJG3fx5BPgg2g>
X-ME-Proxy-Cause: dmFkZTFk/48M+5rIdNjMH+noiUCQAhrCBIjP4UHxtt0bPhQsQl6gkN9/ECk/618+8f4OTQ
    F1ixxjvJdggOPIOl+yVsB0WD2olClEuwqfDUzHjw4+p5yWsybXAG3MRRl1mCcC8Tb5UQfC
    +CvKLXTMUquYtBHtFO5f5zj/FxWPS5E0LxHC6ajUO2KNx5dqcRGNp3bQ6/05g4gPkeODSt
    HX/ZkfWYb6LsJrayrgz5sIw0X7sFhAOpWkMY7vqH/839koFHgR3sTevRoSw1035dYhJKjD
    MiBrc3QjRm8MVOWIvCEyZ54RWFfouILHB3GeZ6RukXBGjqREUF24lkTx/MfCSp7IyxWMIZ
    JA1GZAVhsmtbhH1ucQC4HpgjErG0o8QQoF5+n1I1ulqwd89Wdr1rCtXZteSd0+BORpiSjH
    cTefB5oBjDxlSXi7XfOVvbnrkEvlAk7qyrxDC8GSfxbPl7A+Zj/f9sTlsbSLLMB3FhLoq6
    C0ljTNDt8biVdpl59if+oJgZ0LWq8SiY8VgshDyFDOsMVIbprYb1CVIH/THq3Eal4lo5NY
    07hVZmRJloM9rNQfStZEe5ztbetRZ0HYD1/Pw0cZsVA32huHafM0zIJIYg+sGl0VvSvx8j
    5JmDlQEEPDl9t48dk6IoPAjNZNQI+ew3EZGn12k7cWNzksc9pXTKDwNgaNOw
X-ME-Proxy: <xmx:rXxgasdVoYnIdzUJL-uFcEFeh2Z-dTb_aeI8RyoBOS31jvTQe6IC2Q>
    <xmx:rXxgajljIboymvxl3DAoaznu4xB8tombL50w1InElBwXKW8E0NTohQ>
    <xmx:rXxgattbFUHLP7JNypYKqnEcShYK7neq9YXEkV6qV716OBJ7N1URcw>
    <xmx:rXxgah9xlSGdxEfos8-fYFot97fEjsZZY-LL1b1zpTYpzaErp7AlHA>
    <xmx:rXxgardL5y4ArD1mHdgFvYV329KGHwgDMY9F9H5xuAfWrgfs6BrmYZ8P>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 04:17:48 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Wed, 22 Jul 2026 10:17:39 +0200
Subject: [PATCH v3 1/2] usb: core: Strengthen error handling in
 hub_hub_status()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-usb_core_patches_2-v3-1-87622252bfdd@kroah.com>
References: <20260722-usb_core_patches_2-v3-0-87622252bfdd@kroah.com>
In-Reply-To: <20260722-usb_core_patches_2-v3-0-87622252bfdd@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784708266; l=1288;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=eF2ME2ttEZb0VIdKYcWF8muPJEpju5lW216COc1+Cks=;
 b=y2+61/x6yEce9YZNYFbL2SpqnIP06MQ1gxKMRqAMV4aELyqJo6E1cUgwa5/Vuuw7hVghKWkgw
 pSUIHordL4ZABoJi3sxzP1JHq6XmoLwPRIS3XD4iSfy1kVTzgctv5ft
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Add additional error handling after the call to get_hub_status() in
hub_hub_status().

get_hub_status() uses usb_control_msg() which does not verify that the
message is the correct length, substituting it for
usb_control_msg_recv() would also solve this issue but increase memory
allocations.

Instead, error handling is copied from the method used in
hub_ext_port_status(), which shares the same flow of logic as
hub_hub_status().

Assisted-by: gkh_clanker_t1000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/core/hub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..59b0e36816d6 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -991,10 +991,12 @@ static int hub_hub_status(struct usb_hub *hub,
 
 	mutex_lock(&hub->status_mutex);
 	ret = get_hub_status(hub->hdev, &hub->status->hub);
-	if (ret < 0) {
+	if (ret < (int)sizeof(hub->status->hub)) {
 		if (ret != -ENODEV)
 			dev_err(hub->intfdev,
 				"%s failed (err = %d)\n", __func__, ret);
+		if (ret >= 0)
+			ret = -EIO;
 	} else {
 		*status = le16_to_cpu(hub->status->hub.wHubStatus);
 		*change = le16_to_cpu(hub->status->hub.wHubChange);

-- 
2.55.0

