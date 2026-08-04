Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6034E41D215
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832619; cv=none; b=SKJ3Nkrc0tUnZhu0oTx1Ick/jrr3/lTwLrQKhaClYkmjsKGomOuwCddoIk+NjLmD6ekOdViVnCe3+hufkROZkhSMySEMg3cLzjs/kNsJ/ZudNlUTJFb7UNLU2rDrUTr+xuI1wLkkxE+KcLvW3srPGNbMHYm8Rwt7hT4nSWOaEiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832619; c=relaxed/simple;
	bh=F24DVg1QqlNIQhU2qn3uZfX6t2VTDFsqWTzVHcYX3fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uax5wYNO9qDFknMjEZRj5YbPwhqvp0a9wz+J13oPJIMFikL11T5nyIb7cZ3T/irqycqMsU3lnFBqJq8Ri/DrdM+7zO3HrFXUj+cbQD6SdEX3cJ/ECcUkFDod88VzrSGCWVqCjCAnVuI+kTAXUSfJgOV3E3OmWF+sYFD1CLDgHLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kemqA1jr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kemqA1jr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785832618; x=1817368618;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F24DVg1QqlNIQhU2qn3uZfX6t2VTDFsqWTzVHcYX3fQ=;
  b=kemqA1jrJNnrFQI3F6sxbtdL6wCUMvxLiFWnSP60izLvzQi4gY0Eao9K
   VOqmQMAQa/1Yw7S8un27tV/B/VxRC8eTBh6KonGtUZ7ycyHWkyC10ey5f
   cUofg7VjeeUAh2W2EaHFBQS9p8jiPt7LeudocfVt5yijL/lUFgeWTeslT
   hAzVSiL5Rckb62HI4Urn9z9BOB4zeBjTMna2gy8epEzbn8Hx/KSWmHP0g
   6cn1ay+IGXGghebnvWRPx1ogf0LJ4qj+iau5m4OQZ9ofpwBpASn0M5OIT
   t7lkOe9ipsEaYt1yWY8IkWIQLRWdhTzQBxm/Yvbv2HzqzX6psTjm2Hv8H
   Q==;
X-CSE-ConnectionGUID: O6910/LbSxu1kHDGDbtlfA==
X-CSE-MsgGUID: iJ6tXVOeTSeS9QjhzDk6Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85508017"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="85508017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:36:57 -0700
X-CSE-ConnectionGUID: Iz2Kp0MPR3e55OO7k5aOyQ==
X-CSE-MsgGUID: x2kceIdSTxyrQwfY/XF5NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="265701705"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.245.149])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:36:56 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fix for usb-linus
Date: Tue,  4 Aug 2026 11:36:38 +0300
Message-ID: <20260804083639.2148950-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

xhci may be unusable on Raspberry Pi type arm32 devices since driver
swiched to BIT() macro in 7.1 kenel.

This one patch fixes it, hope it can still make 7.2

Thanks
Mathias

Lachlan Hodges (1):
  usb: xhci: use BIT_ULL for CRCR bits to fix incorrect 64bit mask

 drivers/usb/host/xhci.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.43.0

