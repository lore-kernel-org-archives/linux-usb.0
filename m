Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.81.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFFD33122A;
	Sun,  2 Aug 2026 23:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.81.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713545; cv=none; b=Rek8e3BYOciE3tEptocspmUClq5mgyznUlMblQRsJLTRwNZh8QM5hzm4RKIHjbzvuGC4VyOSUgD1GNuMIAJe7ONbOQwwRQs41/THBl9Y71DxLBMkZoeFIKtkcR4EuUXQ65EaEF1JUI5pWmet7Pg3SE/X/jp4EuSCjQDgW6qnTCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713545; c=relaxed/simple;
	bh=bbxuJ6Ua5w0m6Lru2hj8S1WU1keC+8be1ZyXN4cLPoE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jiLNStlSrBlWE5cf7JUaYVbNCAaYfmrwf9vJuJ7tGbj3S3dMnBLD9fjUaYhJmJUeuYDXlMiNkOnNEZeBaISqdL+5g5NkdhGSL2cJPp6/Zn9wj3jM9VG8pcc73lKqH6QmwJbT6xjxMucSg+zBdZIeKSh9re5WNon4qepKCajZ+kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=GNqq1OTF; arc=none smtp.client-ip=207.54.81.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="GNqq1OTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1785713544; x=1817249544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VKGYXRaxFBGBBiNMuo+qEYq8pPvopM49W6MPT33y15c=;
  b=GNqq1OTFnsvTB8zeDb+Du7BQ0ZAySY7Sm3Ud84yqGs3xvcug08Uoh9yE
   qJ0mHEVwSuuCpgpxgV/YQzHyqtPoz6QBdrmKzjp2PMRbqk+F5M+5KvlDj
   sqCw4T8I3G25mu0RRa5wsEMnloFzQLUqe7kGQLTsuXzg9B/ocAjGZx5JB
   7pafq5T4TtrDImess5xdKDhH1hRmRg8II9vh129wnbUTdIAzmWLGe1crV
   7ndzDUXXM66WgxL/51rlJkSBFMZcSGaj06BeWCIJAwva++44h13eNz5C9
   SBK1k89CQEzrZZycPdbCDfoxeaOsLt20Dg2ni32XfkBSokcEuPVky2t7z
   Q==;
X-CSE-ConnectionGUID: 3uHEfVXNQYGZdHK0W2M7Fg==
X-CSE-MsgGUID: ohypSOJAQm+FDY7bUOihXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="117645078"
X-IronPort-AV: E=Sophos;i="6.25,201,1779163200"; 
   d="scan'208";a="117645078"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB09.ad.harman.com) ([199.27.113.4])
  by esa5.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 19:31:15 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB09.ad.harman.com (10.92.6.246) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 3 Aug 2026 05:01:12 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Mon, 3 Aug 2026 05:01:12 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id E5AEA80059; Sun,  2 Aug 2026 23:31:11 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: [PATCH v6 2/3] Documentation: ABI: document DEVICE_ENUMERATION_FAILURE uevent
Date: Sun, 2 Aug 2026 23:31:07 +0000
Message-ID: <20260802233108.70950-3-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20260802233108.70950-1-Akshay.Gujar@harman.com>
References: <20260802233108.70950-1-Akshay.Gujar@harman.com>
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
 Documentation/ABI/testing/sysfs-uevent | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/testing/sysfs-uevent
index 0b6227706b35e..6ace99f99daa3 100644
--- a/Documentation/ABI/testing/sysfs-uevent
+++ b/Documentation/ABI/testing/sysfs-uevent
@@ -49,3 +49,40 @@ Description:
 
 Users:
                 udev, userspace tools generating synthetic uevents
+
+What:           DEVICE_ENUMERATION_FAILURE
+Date:           August 2026
+KernelVersion:  7.3
+Description:
+                Some devices are detected as physically present but fail
+                to enumerate, for example due to protocol-level errors or
+                invalid responses.
+
+                When this happens, a bus driver may emit a KOBJ_CHANGE
+                uevent containing:
+
+                  DEVICE_ENUMERATION_FAILURE=<identifier>
+
+		 The value is a bus-specific identifier of the port or slot
+		 on which enumeration failed, not the name of the device
+		 that emitted the event. For USB this is the port device
+		 name, e.g. "usb1-port1".
+
+                 Example (USB):
+
+                  ACTION=change
+                  SUBSYSTEM=usb
+                  DEVTYPE=usb_interface
+                  DEVPATH=/devices/.../usb1/1-0:1.0
+                  DEVICE_ENUMERATION_FAILURE=usb1-port1
+
+                The event is emitted from the hub interface that owns the
+                port, so DEVPATH refers to the interface. Appending the
+                identifier to DEVPATH gives the failing port:
+
+                  /sys/devices/.../usb1/1-0:1.0/usb1-port1/
+
+Users:
+		udev, userspace tools monitoring device enumeration
+		failures
+
-- 
2.19.0

