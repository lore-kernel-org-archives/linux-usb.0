Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130502D592D
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 22:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782773857; cv=none; b=f8uOsq00tdpGo5ZL6ehMznPTJAMP6H42mdvjKVDcKVjUpehATjMhwIe8IhJOkgTwzR8EeQXI0I5RkSBwyQ/kFteBuGav8F90y8E88GfaCxBcxFdmiArhzPVhx1UyaNY5ksSqEHPUzhYtglstbQCMuuIzqFiG0FoyoWpvA9sYCI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782773857; c=relaxed/simple;
	bh=GiXxLtl1P1XbEH0oyi5J9wAwdiTypxlJ70f63akOSns=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=p2KFQVheB9UzxNbxvpE71gfFNxmde5AdBhjt7cBWs9U4W6p+6WPIJ6G6saCpW2B84M9U6KP8XpHODKLoHk4oS1X6c5Xeg/iFgBZoW+ESWdIA0JQ8v4l9pwgbUlSQ58zgtahlmJgOktQ8nyuh043Q7zrBucJA94UdYJauXlbGhgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uewgX/IP; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uewgX/IP"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-30ed53abff8so1300720eec.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 15:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782773855; x=1783378655; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sZAq36oBzQWFCHP4gcjbtQoYLdbVzm7rvIU7UBdOMgQ=;
        b=uewgX/IPv8tgSd0EyB68vrE2uNytWJzhzEZrjn6EZWTaXwGOz+knHDrXN75t+DhIgT
         1IAHS4zVP5gS46gUoOE+QUbYjseeTOtYkg/le7thSB767g83AR46vChke9mIwL5ei/mN
         iqyt6tifQ3mSHsXOJ1rEVCjniQE/RuzMb+AIfTbK9d4zufqxTbetvbg52S/NXJ/lMhYo
         nyzlk6x9ItIvw4gh92Ax/ixg4rF+KdTl6gOVhNaqwsHSpfdySrA8/8GDsynL9+p8ugf3
         JFsZ9dYC07E6e7upK1xnnsXRcusWdTzA6hM2yj0M01zEuFcTkpwhBuMyXs1mM7FEvZXs
         guLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782773855; x=1783378655;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZAq36oBzQWFCHP4gcjbtQoYLdbVzm7rvIU7UBdOMgQ=;
        b=ih0BxWdHiT/H4pNowwn+S8cSZVqnE4Ecyz60aBtk3KbF7BjyPbveICXxsTncq0lFyP
         UeeKNfF5gjGM0pzAErJ233fqdiWxwsUZQaSAQUR1E/T0OKtW5zDRbnPiZ5J++iuCJ9zJ
         XXZYLqwiWPPi2jEo8Ev6QY7PN7aOldxGIxlSzvHUDGO4pTqKq9juAJnGgXSjSkuOiODu
         vKGbNkbguLhfb07b34IHW6PAjO2DZ2ECEYXqQdNBvhxxNAjGzBtP64PuFfzP2mMIgPGx
         YCvGbJnD2CP7hMtZgP4MfqdeotffK9dzT1HaFyciZbFPtASVwOaU9djPwJr0eBLMd63f
         ge5w==
X-Forwarded-Encrypted: i=1; AHgh+RoNdFE9TlOyL4jk5a0jHl9iITgolmeLMKnFt6envWWJoxUkId8ER8scByektuAwaKwFvaWCiLoLG6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEH4pkjaxAKNMuhQOdOXsNUJJ645gQAH4BXIIKgKG1lcZj2KQQ
	k2DtmJihLs1AdciKYsxH3mVc+IIdSllZ7CZHjakxzNn6I65t0svjYfXknQWEgUHQnOhKRSsDwuW
	Epc99vg==
X-Received: from dycnl24.prod.google.com ([2002:a05:7300:d118:b0:30c:8f2f:dcea])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:3f19:b0:30c:99c8:2b1b
 with SMTP id 5a478bee46e88-30ee1344fbamr935043eec.10.1782773854830; Mon, 29
 Jun 2026 15:57:34 -0700 (PDT)
Date: Mon, 29 Jun 2026 22:57:29 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260629225729.2749896-1-badhri@google.com>
Subject: [PATCH v1] usb: typec: tcpm: Defensively bound altmode array accesses
From: Badhri Jagan Sridharan <badhri@google.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com
Cc: amitsd@google.com, kyletso@google.com, rdbabiera@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

While svdm_consume_modes() already prevents mode_data.altmodes from
exceeding ALTMODE_DISCOVERY_MAX during SVDM discovery, defensively
bounding array iteration indices against ALTMODE_DISCOVERY_MAX in altmode
registration and unregistration helpers guarantees protection against
out-of-bounds accesses in the event of memory corruption.

Ensure that tcpm_register_plug_altmodes() is also bounded alongside
tcpm_register_partner_altmodes() and tcpm_unregister_altmodes.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 7ef746a90a17..c9ac9381b17c 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2029,7 +2029,7 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
 	if (!port->partner)
 		return;
 
-	for (i = 0; i < modep->altmodes; i++) {
+	for (i = 0; i < modep->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
 		altmode = typec_partner_register_altmode(port->partner,
 						&modep->altmode_desc[i]);
 		if (IS_ERR(altmode)) {
@@ -2047,9 +2047,10 @@ static void tcpm_register_plug_altmodes(struct tcpm_port *port)
 	struct typec_altmode *altmode;
 	int i;
 
-	typec_plug_set_num_altmodes(port->plug_prime, modep->altmodes);
+	typec_plug_set_num_altmodes(port->plug_prime,
+				    min(modep->altmodes, ALTMODE_DISCOVERY_MAX));
 
-	for (i = 0; i < modep->altmodes; i++) {
+	for (i = 0; i < modep->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
 		altmode = typec_plug_register_altmode(port->plug_prime,
 						&modep->altmode_desc[i]);
 		if (IS_ERR(altmode)) {
@@ -4891,11 +4892,11 @@ static void tcpm_unregister_altmodes(struct tcpm_port *port)
 	struct pd_mode_data *modep_prime = &port->mode_data_prime;
 	int i;
 
-	for (i = 0; i < modep->altmodes; i++) {
+	for (i = 0; i < modep->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
 		typec_unregister_altmode(port->partner_altmode[i]);
 		port->partner_altmode[i] = NULL;
 	}
-	for (i = 0; i < modep_prime->altmodes; i++) {
+	for (i = 0; i < modep_prime->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
 		typec_unregister_altmode(port->plug_prime_altmode[i]);
 		port->plug_prime_altmode[i] = NULL;
 	}

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.55.0.rc0.799.gd6f94ed593-goog

