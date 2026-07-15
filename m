Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.81.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E16370D6E;
	Wed, 15 Jul 2026 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.81.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115690; cv=none; b=jBmVasEm1EgUEsyUbw2gUJG5TRKZhtQ9iRIZ6PdHaGxbVugbCsfwv5K8VV1VwDEOcyRbd0co77pOKwUFfgEoWo6rXpTsRoAh//qvWBsc4Ip77SbOTjMfEvujvKJBDCxDUMssP3tj2r86J9zK4JVKxfqmzbETmJV0UbhTAc8QmFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115690; c=relaxed/simple;
	bh=CKs/rlBnd44Kf9iKW+e08vTczsr35CY0iB5WV1nsC1M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hLza7m0iZlQvVkUAgG+ADsecePjS7I6bpCgeEMG/gymNI8yb2ozZ/b55diZw5QZ9VeRBG7OVZG49kDCZxtme4pCNTY+w4SlvC2UMV4Dy2d38EeotctImrPhCVR6R9lxQgru5H2kj6c6fo6xwr9jgKkJiyGrgko/j+H60wwHwGo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=TbfseFb4; arc=none smtp.client-ip=207.54.81.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="TbfseFb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1784115688; x=1815651688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ILzIKff7RGFaBl5kVaXZtOSWZKbrGWQmGPtRvqAyKk=;
  b=TbfseFb4kq0qRR8yKy8DEFdUUO9/lS0Rml7SNEZCm6AiBLE7oJU7dyjX
   033Wcwwkc7CUKv4+ZFuawmNqun9TRoi1qB0giRvl9JXvoKU+ADcUwy3YQ
   3BNWf5Z3BsQZPNTsccatqDlBm3ZYNx4dB9dFO36rWpJa8J8LNWanvlF6k
   t6lQ7+zsRKkbSn08ltGNkzbcWYqwebVxagj58V7DRz3JjzGOohfMlAPCU
   r+nEXQf4SjWCK66HuVdYdBc/zXZ9dS2cJCAsD6fEJuJ9RNrO2Mcr04rrB
   P1W/B3uq++2TR8t7xOvsDpTtNZGjIaXUfO4rc88VdC6i0ndufYi4f8Y8D
   g==;
X-CSE-ConnectionGUID: a46Qt3/5RzS3BPxb9gAGGw==
X-CSE-MsgGUID: Qz1i5OdJRl2IdoU3SCmnrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="116982821"
X-IronPort-AV: E=Sophos;i="6.25,165,1779163200"; 
   d="scan'208";a="116982821"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB09.ad.harman.com) ([199.27.113.4])
  by esa1.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:41:20 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB09.ad.harman.com (10.92.6.246) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 17:11:18 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 17:11:18 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 20A7C8BC04; Wed, 15 Jul 2026 11:41:18 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: [PATCH v5 2/3] Documentation: ABI: document DEVICE_ENUMERATION_FAILURE uevent
Date: Wed, 15 Jul 2026 11:40:27 +0000
Message-ID: <20260715114028.3627807-3-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
References: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Document the DEVICE_ENUMERATION_FAILURE environment variable emitted
in KOBJ_CHANGE uevents when device enumeration fails.

Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
---
 Documentation/ABI/testing/sysfs-uevent | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/testing/sysfs-uevent
index 0b6227706b35e..e362c34aa2ef6 100644
--- a/Documentation/ABI/testing/sysfs-uevent
+++ b/Documentation/ABI/testing/sysfs-uevent
@@ -49,3 +49,28 @@ Description:
 
 Users:
                 udev, userspace tools generating synthetic uevents
+
+What:          DEVICE_ENUMERATION_FAILURE
+Date:          July 2026
+KernelVersion: 7.3
+Description:
+               Some devices may be detected but fail to enumerate
+               due to protocol-level errors or invalid responses.
+
+               A KOBJ_CHANGE uevent includes the following environment
+               variable when this occurs:
+
+                 DEVICE_ENUMERATION_FAILURE=<dev_name>
+
+               The value is the kernel device name of the device for
+               which enumeration failed, as returned by dev_name().
+
+               Example (USB):
+
+               ACTION=change
+               SUBSYSTEM=usb
+               DEVTYPE=usb_interface
+               DEVICE_ENUMERATION_FAILURE=usb1-port1
+
+Users:
+               udev, userspace tools monitoring device enumeration failures
\ No newline at end of file
-- 
2.19.0

