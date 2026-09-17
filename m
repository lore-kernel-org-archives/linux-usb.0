Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B273931AF2D
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 03:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789615213; cv=none; b=gxUbrvrj3mQ1ANJyXoMflYGnt3S9alV/37dJUOzRzAYI2UsSSiVkd9MOrfWtsooviJxZ45I55PqcE50ssBbbsWLmB5cmC1AtjewY5bQnPfgx27l3Hehmz+4M9zQJyX0i0f92vvdBU1CcN7GU57mxRLXGliRPsfLYoIDz0ozdtSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789615213; c=relaxed/simple;
	bh=+Zoa3hTlhW97Z1Fdg8ZXaa7K5K4U5NJd2vwJcnpqcyo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=teLQHK3vDCdDbJ0U0ydJJYEuYWiH2vKTZhIQ6M+13NIE4qJmmdH6UMeJir9PYFVLGBqMxsNeUJA2KTY7kBu7sAJikk/4+sLvxggKlm+oAArohZpFBFSfRsNdlY6r8DJFMHEgN2d2Z23seuT4IsC5JeHYBFGKwaB4+qtAUjnM2hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q0oZMwBr; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q0oZMwBr"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so599512a91.2
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 20:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789615211; x=1790220011; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eG+4OkgZdOu4T7Ozr6+fDvucorju2O2n5bdII7mZ0hM=;
        b=Q0oZMwBrt6+mTdXK7NJ0Q+MAna0X1PAdoTmUWnfDw1C/T2rRx5FjqEXbKWqM84IURb
         pv7UiDO1PywwKgewU2ZCVN9ZSUTiA3NDEruH9P3rxciYXHu4p5zQrHB2J5/iZAK7I3q9
         n05n5vgO3kL4YpouqOqAwg7fU/iqX2vmaWH5ZzgSgO0QqCJcxASoQfOCIepF1oyqlrCA
         G9ytI0Wxc+GEQMakOBDsq23YTPXGca6IWtZpGuwQQXnYARVvTw6AtYuFcbLhJ+YKrzS4
         bcpKoGxO/h/69p90hlXYw+0w8eBbAN5fAfA/WJ031lES9rzHfocYfO+6dnjPuu5lttlW
         KFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789615211; x=1790220011;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eG+4OkgZdOu4T7Ozr6+fDvucorju2O2n5bdII7mZ0hM=;
        b=qCOmvO8f+jb+EmykTU0EWremLB9Zva7slhyTIHiYxIGA4dbqSJKZaaNZ48T7Q0hzum
         g3R0mFwJDyYwuiiZ3O2OaNwEZ2DnUf7CJGNmjGraoxkvnzQGxo2i7GNeJ9hsG1FP9GnL
         C+n+iFOt87FKVnFfnDCSQZGX8YspA8AlPcR9+Cvbq5OJTz97T/B630ijzLYdjZJp3Rth
         TBXcyQ1vYlZABAdbDiabGH/sJqfscWitMpNkAVC1oV4SI+4edmhli4jMiwxjUx9iUNfR
         hvkoYauqPazfGb2qL7I0ntrNvG1Zpc90s5q4IptFd2+pf11vfN+46pKYvCyEZ1NRiD8K
         WLGA==
X-Forwarded-Encrypted: i=1; AKwUvBxEGOXAMTLz3VO8l/WJjwznLKvns5dTOdCfcWGFPlfarLXygmxiF+NuGQP5wt/M69X3QFdMBuFySyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ldppX/Q/3ilnuDZZ+xLWQt8nHSzILDwQi8g/bANzlU6k/gmQvd
	SkoAgNocV2pOt9d8FFilqB0WwPleEzxqYnV/2khw5tQ+inXX3JZxszKEuw6n+ASwPUFCcc20TCG
	xB03+GA==
X-Received: from dly18-n2.prod.google.com ([2002:a05:701b:2052:20b0:144:c095:7c1b])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:582b:b0:39e:f1:b2de
 with SMTP id 98e67ed59e1d1-39e1e4c54fcmr12016131a91.20.1789615210639; Wed, 16
 Sep 2026 20:20:10 -0700 (PDT)
Date: Thu, 17 Sep 2026 03:20:08 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917032008.1701888-1-jthies@google.com>
Subject: [PATCH v2] usb: typec: ucsi: displayport: Current CAM OOB index fixup
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Update ucsi_displayport_enter() to return invalid error when the PPM
reports an current alternate mode greater than or equal to
UCSI_MAX_ALTMODES. While here, remove 0xff current cam assignment on
failed GET_CURRENT_CAM response.

Fixes: 04cec690b1fd ("usb: typec: ucsi: displayport: Fix OOB altmode array index")
Cc: stable@vger.kernel.org
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Jameson Thies <jthies@google.com>
---
Changes in v2
- added fixes tag and CC stable

Original patch didn't incorporate reviewer feedback. This is a fixup
to be amended to:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=04cec690b1fd9d1c4c314b91a10d8c68a3acfe18

 drivers/usb/typec/ucsi/displayport.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8d2032d0762c..572da7bbd29c 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -71,11 +71,14 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	if (ret < 0) {
 		if (ucsi->version > 0x0100)
 			goto err_unlock;
-		cur = 0xff;
 	}
 
-	if (cur < UCSI_MAX_ALTMODES) {
-		ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
+	if (cur != 0xff) {
+		if (cur < UCSI_MAX_ALTMODES)
+			ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
+		else
+			ret = -EINVAL;
+
 		goto err_unlock;
 	}
 

base-commit: 600334ef2f29b975485ce062a81fcfa00bd3ef45
-- 
2.55.0.1082.g2b9226bbc0-goog

