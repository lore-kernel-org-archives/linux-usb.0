Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626965;
	b=5CPB0kN00GuS0cjcpuFX7Xm2BEFyPiJGnHb7s+xB5i4vDK6GFli8J96OWSNmRnj3bmzj
	 LgKvyXJBdcMOdIRmZqwgCsjx03k/97fMTMror0UiyIaeLe0ZDcKVHJPGGBe+xUuXkL5m+
	 ECEWj9JJxZx2M0q7ZOtAse6+uin8Yc5ce6GPTZfUjjSv6Xh2tE/er9s64+DoiBAgv7/Zl
	 mklUpDpgVO999xIub1ZLAwWL7gS7j92iTWeGi5TgzDYlwJ9o7EWu/g9u3P6lHaOd+LTgq
	 Ty2W3AogrAIPgsX7CieYXW0e440rq4Jl7VL+bwnh/t+eo7K2pcgXNmCU/1StrR8WZOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626965;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QMacUzQpD/UCu4yt+xKfCRZFefUpooFPVa4iaD+RgpA=;
	b=LGy+5bCEFlE4SK1BSd+fh2XMugTn8aL0iyKVe/FoO/RKAQ+tg5TKnnUubdwpSnVoYXrA
	 /nnx2VH0zBp2NHigruqCOeEmY45Ie7ZiLblfoFk3uRAETZAZXM5S7EdHc4cABJxTMo8xC
	 lMLCgPl/Ptr7YPJ6trRffsvHhJ1Y6O54ZrgAZHJFWD0HHGnb1bI4yAcRRghHb77U3crQt
	 MpnJ9xOgqbg+MqZOtQjDcVI+gr6vU0E1tEbTa2d71bDDlamPtYLQulj2iy8Q0Yex3Yor/
	 HR1yxgqrO3bDot+JhT6/Wf2XmXxYIHcgTfQsjHSPtWGW9l8GqcKir3Ke4jRwdVvxOpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nJ3B4yoE;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4E7606A326
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 13:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4E7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nJ3B4yoE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793626964; x=1825162964;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/WcJo4v1N0XOtEBfYZnZY259a/1wdRQBxbpd3tX/+iQ=;
  b=nJ3B4yoE+z6rVdI2u7fy31ZPWHxa9H7f6xuHDLC36F0jr1IkzkMbdzDA
   1akHFgfumE/qOqN9t7wo3/CWUIpgr5dayW6ixwXtL//sQ7SsPtwIIgNoI
   i++oWBT8DpsNKTpA6TGKJwJg8GCq7ndlVykwElAWRYSz1JzTqtv8MLM7g
   oIyV6VLuZuQTYqJGRDQc1kzO2XWUfbYsc7//h9vlFQM1/EgRRDJ7Qv/0k
   mZk2ggeDlS9MrL8vos+ECwmyxw9b66kGsmH4IRANfk0GHwa+x0Xjn+Rrt
   SGYN81n4C5s3qV88wIThzjPd68tvpAPicxEhdoKIkBM9x245xUKRijVdW
   A==;
X-CSE-ConnectionGUID: 9Y735+UCT1+AAq0dJGmR9g==
X-CSE-MsgGUID: HBhpTwW3R9KWAIQauxTOqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2218140"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2218140"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 05:42:43 -0800
X-CSE-ConnectionGUID: 6msK18x6SImP2Qz6cRaQfg==
X-CSE-MsgGUID: IzQJTifATJ2b5eNm1C/fPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6451312"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 02 Nov 2026 05:42:42 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id D046799; Mon, 02 Nov 2026 14:42:40 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	regressions@leemhuis.info,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 0/2] usb: xhci: bandwidth and endpoints accounting fixes 
Date: Mon,  2 Nov 2026 14:42:26 +0100
Message-ID: <20261102134228.584032-1-niklas.neronin@linux.intel.com>
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

Fix two xhci accounting issues: one related to bandwidth state after
hibernation resume, and another causing total active endpoints accounting
to be left incorrect after virtual device allocation failures.

v2 changes:
 * [PATCH 1]: Fix commit message format
 * [PATCH 2]: Reword commit message
 * [PATCH 3-5]: Dropped

Niklas Neronin (2):
  usb: xhci: clear stale bandwidth data after hibernation
  usb: xhci: fix 'num_active_eps' accounting on allocation failure

 drivers/usb/host/xhci-mem.c | 16 +++++++++++++++-
 drivers/usb/host/xhci.c     |  6 ++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.50.1

