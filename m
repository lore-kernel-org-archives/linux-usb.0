Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603552;
	b=OelTlQZ+CehFQeulfRKtRCP+O5YM/LFcOx6/ydAg4ibE5bkkKhzXnD+8uVxsi4/s1BQz
	 31g5IAPwG4mHDf1SzMkeDtmQ3CqnMjwJLM2CcAN49oBb45p+aLITtc9Kxc1zYlLipgFRW
	 EDvHaNRlwYvktJRWrCHf4xumttdcaf5ISbzd+rzHcneuFP1KH/3F4vYVQAv7OGqEvWonP
	 bPoNIADSuxK87QhrIuYEbBbD2tVhqAmCud73chHSM8XbXr3uUkpKo74dttEsGQFmZZRDf
	 SBVIyMOk/DejcxguvJvZoXyH8HGIlRaUFunYB6Ze/LNFdgO2sTBYImLvHiML2MKW8Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603552;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QQjQubvQFFHnJUgRkwgbTGwoMN0jKJkvyPs+yNp3Jik=;
	b=Id7jVwuI5Wvb3VIKmgoErWXJfx1/fMkAN4wkwMqJNlKeuBfqY+tazXC34k4Q+3TIFx76
	 jD5HRutgeKmLj0YgRRdlfWyw7yLjQ/fjFijeexGuKFLKl9QiOsgEocEXIBDi4LjW5UBas
	 doerJA2TelwIQ9dgMJnU+McmSRwGq7iI9Zgv2w+Y3qWV4HpKfSgerTwHucEJ7tcgrr793
	 eN95jDXVMKB6AG9uS3sGEimJ+l9rkDiggdcw8npUVaT2mNLgMc1iUQB1yLDv+7c+PUFYk
	 I0bzrhHD1Dx/H/GzqX3eZ1vHoz86rMyNxEsDR4kbDAENmBD7gRmeu+he/tZW+mLo6YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MU7aHHPH;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021A3606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 10:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 021A3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MU7aHHPH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795603552; x=1827139552;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/Zl14jTs48GbmUfs4SVi937G00kwaPE8YL/N+lsNR3I=;
  b=MU7aHHPHlJT96s2qShBNs3pvSXmQrtgALWGQQvkjhfSMxGPT9/D9IIF3
   p0JAn0i3Y+6iVDYxNMHkxdNLOWDvbMbvG6Gl06OVPAM8eICAsNACK+pWf
   Y9eKe19kBPeSSs0ncHhDclrAgxPve1kKAScCRkzuM/aDnIHitKHvdOvx9
   O1ejjBqh30K/T+msauNplTFgFAfIVjtXuNxT6uC3eP0Z/GrowIZu+2zQp
   XsukDA3BPUVXjCT3Z0mWuehjE574tgi+o102t+uI9AC4e2tH6cT4MC42x
   DdDfkuGek4VIn0Uj+ISl31kZv/JHntoKAvdwLSkrVWiU3SqOnTPrDe3xW
   A==;
X-CSE-ConnectionGUID: 7t4uQgGzSSWO0uU94QA7xw==
X-CSE-MsgGUID: t6FPh/pSRqOHh+OxgW3hjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4493238"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4493238"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 02:38:18 -0800
X-CSE-ConnectionGUID: C4Mx+9TuR6WQnA0O4EQVUA==
X-CSE-MsgGUID: UbzfRXyGTKiLoyPzFKOjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11831620"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2026 02:38:17 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add entry for the TI USB PD controller driver
Date: Wed, 25 Nov 2026 11:38:15 +0100
Message-ID: <20261125103815.299916-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sven kindly agreed to keep an eye on this driver.

Cc: Sven Peter <sven@kernel.org>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dc38c6dd02768..b6ac6635f67b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28058,6 +28058,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/ti,tps61310.yaml
 F:	drivers/leds/flash/leds-tps6131x.c
 
+TEXAS INSTRUMENTS TPS6598X USB POWER DELIVERY CONTROLLER DRIVER
+M:	Sven Peter <sven@kernel.org>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/usb/typec/tipd/
+
 TEXAS INSTRUMENTS' DAC7612 DAC DRIVER
 M:	Ricardo Ribalda <ribalda@kernel.org>
 L:	linux-iio@vger.kernel.org
-- 
2.50.1

