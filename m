Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A1384CE8
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 23:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787701589; cv=none; b=GgrM6Rb2n/4HMn2iVAnjrBoi0mWDtzX1gqV8OhwVTHlekB9rLThNK9Fn+l2gY/wgcovF+3Rqz3QCHXVuQw9Eo518C1wtMsfE57p/nPR+uxIPH9S48BTwVAmqUXL7ZVA8AKoCDf0FHbgl0PMmu9Li6XW5BBkBHcWitsc3Wdg7Tnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787701589; c=relaxed/simple;
	bh=hSy0TDwkiRxy03N0dGR6M5FyPGFSqOUpx+giGNStmDQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VIX96OyxxaOfwD80Mo5lTVQbSAy+AHk61CO5FggMgsI5jIa3CQvmHuyaUVm+rMwwRVlxfH9VfGSAzWcGWAjzEJ/MACEBtiynOfO+/6lPP9TorHDFMy3GKi+qOPdTFPSEVqpkhjutixqMUKzNpPNtwqsh3aAx1yEgczcHfbVIBMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hj/T9N0h; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hj/T9N0h"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so702005a91.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 16:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787701586; x=1788306386; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0+d37aFEBatttrxB1z1hnSPDhmjQUMoxQTvWGkjabs=;
        b=hj/T9N0hTHonoB2LdnhuJmcFXtuZ9UvuI3/aZE5Tg4U9lDc00++7iBJG5UP8iX/hRw
         vuqmvK9igSukTLqaJ4GcW8MBzrO92pVTXZHeucVAeevCD/qRs3RHiuN1+IXstfCWxz0+
         ldU3d+EmFnTlPjD79QeTiaw3YFGRuuPA3wkzR5Zxo+9keHJV5KCeXEeHN6lCRAaMYrjh
         KZriOEVxJ1i6ysL4nBDeb2tvPZMH1R5HePRL7RuA1gpIDyNJZFxjXTSTWpR6ivz0syt9
         Kl6li8YV7b17qgFRcgg/4uC0aOSeQwtsCRHu3ubXiU0RTgz8zHgOBkJhD1N/eTqtvMU5
         aI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787701586; x=1788306386;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0+d37aFEBatttrxB1z1hnSPDhmjQUMoxQTvWGkjabs=;
        b=p7w8AyGQ893Fj1EI+jpjsft3+yGZmekUuR9HQs+cmSlnfPV71eEh066PCGDBGZcd4w
         UD/jw27ATl3WmxS/B40ABW6uH5AqocYRyVKbvyr53oXGpwxI493gBJlvg2addT5loOG0
         WA60yCM/knhbeR73uK/ze6VhNiuC0caFvVe55F0/ORJ1Ap6wMTvrIvSFrdemkox2MwQd
         h4fCtvHi5XEi/fPRvWVbRvc08w/X8Y3qNsEHBfZYqUiJw6jd6ZmEyQlmL8D2AAgNP88y
         FD0zLbtYo27xrwVhzhmjJ12kLXCAg8f2zljg4Ec2ILn2/zePp5z6JHLy30l9Dj7CM+yH
         EPvg==
X-Forwarded-Encrypted: i=1; AHgh+RqUAZldGc6nk/vmr6MTJnRQc/SgYxtszpLZJdvRP6eIA2puT1WW0jGVCoGF2SvmNvN9d6B6iNeFo0I=@vger.kernel.org
X-Gm-Message-State: AFuF++ngXUd6iAtlUo8N7ToGDHKHhqS/KwoVUTE4CiPpt7ID5KC9HZ1G
	K0sG/4aLE4z1DzWm7roIaBX/QhJx4GDJRaCeboyyELqqWObMLjm6rOtnodO6in3ljEVGwPEIgO8
	OH43wKA==
X-Received: from dylq20.prod.google.com ([2002:a05:7300:5994:b0:327:dccf:72c8])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b8b:b0:38e:67e1:15b
 with SMTP id 98e67ed59e1d1-3966d3d9581mr5330179a91.6.1787701586417; Tue, 25
 Aug 2026 16:46:26 -0700 (PDT)
Date: Tue, 25 Aug 2026 23:45:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260825234545.2076049-1-jthies@google.com>
Subject: [PATCH v1] usb: typec: ucsi: displayport: Fix OOB altmode array index
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The UCSI displayport driver indexes the connector's port altmode array
with the GET_CURRENT_CAM response after checking it is not 0xff. The
port altmode array is UCSI_MAX_ALTMODES elements long. If the PPM
returns an invalid GET_CURRENT_CAM response above UCSI_MAX_ALTMODES and
not equal to 0xff, the kernel may crash with an array index OOB error.

Update the UCSI displayport driver to verify the current cam is less
than UCSI_MAX_ALTMODES before accessing the port altmode array.

Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode")
Cc: stable@vger.kernel.org
Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/displayport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 7067f2561b84..8d2032d0762c 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -74,7 +74,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 		cur = 0xff;
 	}
 
-	if (cur != 0xff) {
+	if (cur < UCSI_MAX_ALTMODES) {
 		ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
 		goto err_unlock;
 	}

base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
-- 
2.55.0.860.g4b6b3295ed-goog

