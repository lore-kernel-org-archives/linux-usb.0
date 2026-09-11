Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B14741B8E4
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155138; cv=none; b=e25p5lDBo8sy/1iyvbou1/6wLLxn1iO8Aq8IhS0Sze0GUyXe2dkNay9FK3ZlUvHGneWdVXZC614l4zTonIMBKo+FzXRL4YCBN020camK+OZwyGlaGzpXQQsg2eaityc193yBmLIFCZeMYDwwPvSRcAlC7OHTQL8xyn0KmLRUrRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155138; c=relaxed/simple;
	bh=MWBKaKAgVwihCCWR2GGd8f0EU555UEzyDLj0NZKrvrM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=S+9FfG4oW8ice0YH82++zpJsjeQcaJffPh6C92yPZ+rQY7BlH7kKMGgyHDrLBKv0M5HgAXbxpR99HpW2JTT2CNgd/t2tetWMXlmGhgSK339nIClHbP9mn/4veoxPq3D4FPa2OhfuKko8L0l9CGpcw8VS8Ou0jDSPV4k4upA/gqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sfjaA5So; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sfjaA5So"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so1833849a12.2
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 12:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789155130; x=1789759930; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C3Sdr0xnGJhayX0+7SVudIOnTCNUYdJvqUT4sShaBGE=;
        b=sfjaA5SookkJboucp7EfUVKtBXVPixlKaLXtH8oesjq5VjK9M4Px/9pNFUNbTd4siC
         3ddgpjvLHZYmLEbo76r8dDRVdhey3Ej3Z1ejU1uN7wtRYvP4sfLWknMx1WBLZr5IcxjY
         l/8TK/wEq5PhGuvg69HT/6tKzLtr99W84e7Sv97E3QlrxmVD5poeg8e7iWs5kh+cPzjs
         liYtlIK66eO6fWhKHhLIjHxuPXHHMDrL6yaAWPij9IxrjzzDKTPqq2NweSW/vQ8iQ60R
         UKbvE26RxK7ZrO1sh0RHFMUBHkH/s2p+30eBzy4dC0ogkHWH2j7GA4Fi9XBdg7zODl/7
         /Vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155130; x=1789759930;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3Sdr0xnGJhayX0+7SVudIOnTCNUYdJvqUT4sShaBGE=;
        b=DZhBJtDPAYwgtlqWwQQLSpm2drxxI+a08ZE7OWPY9WTbezrydnk7t1Re5UUpAGvuWJ
         RjJawN8WuizrebARMYtuA8OyhGf1yLT0hWiwcsNztTc4ICtvaAXEC/0JBdMgiNVrZV1i
         afTgKnppJAa6Aj7ZDk0XelNnK5PGArnrVUy0xN57egQG63ajcRqxNmSnoGEmZyOK8V4I
         KMPY5e2MXFQVJE4IQSDalffUJ/qhcrj2/80jUISlggOirmkopibyWJEAq7GU5zQPxmtB
         uIqeNrLDjAKo37MU50jnMfNSbJpNPsK8rQtk0VYS/rHZd2gaIaghvpny14M/nkA6Y73L
         vagQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlxnGnop5qzdM0Jt1hpuAjdUadtPF8hLFhFCosmnAjmptxAS9CgHgfSk6/Ry1TteFL7NTfb8tf6/I=@vger.kernel.org
X-Gm-Message-State: AFuF++nMjvvVP/jJb07G6H9lTh6WmPC/lzehC5rqgSvGSh+EAkjEXCMn
	u5U9msUnw1MZ99PSq0JQmzO/MR0IU1cCMnzGpjrMv655WBwg4qtCMBH2WYjXEakx5FVHr+GHtQL
	Z3OqvHA==
X-Received: from dyaw18-n2.prod.google.com ([2002:a05:693c:4152:20b0:33b:a05e:d42e])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:329c:b0:3d3:afd9:6040
 with SMTP id adf61e73a8af0-3daed3f044fmr10105464637.27.1789155130306; Fri, 11
 Sep 2026 12:32:10 -0700 (PDT)
Date: Fri, 11 Sep 2026 19:32:08 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911193208.410015-1-jthies@google.com>
Subject: [PATCH] usb: typec: ucsi: displayport: Current CAM OOB index fixup
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Update ucsi_displayport_enter() to return invalid error when the PPM
reports an current alternate mode greater than or equal to
UCSI_MAX_ALTMODES. While here, remove 0xff current cam assignment on
failed GET_CURRENT_CAM response.

Signed-off-by: Jameson Thies <jthies@google.com>
---
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
 

base-commit: ed2050bc671b44b2c948dbd4347cc534d44ccc9f
-- 
2.55.0.1007.g17ff1f9808-goog

