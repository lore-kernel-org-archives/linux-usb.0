Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959893B47F5
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855298; cv=none; b=MH8cgp4qf/pBIdj0wAw8wuLT6ACzycITWuCirynWWbzbW6RtdvOz9Alp0cX2bs5Z8Sg6UzPlpe8XcN4Cq8+rks+URAR/IB1tTrA2zEoKvMNeNldSbdgkwhCKzSMxnmUjsITq2Ya30HqQNp8sBEVVymnnZP9lTL+xE4LGPvQ5PdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855298; c=relaxed/simple;
	bh=FwQ+/z67uKNrbquh4q+/vU4BtkvT+ruO62X2PCRE4Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CttHGdxtlw5MmKll57L9uPGr0NmmmDQhbMw/TaxDA1QgKMUnQaXxY4r0xMXkBk2lEWdLTWR76j5/1pIvd3yACVaJiXf/0Q5TpvtyAltsYtsb2t2ZOlAuaSk9r7G9Ia1YZ/AIPehVrtHXPu+FLzCTBIvSdB/2dg+kswIiAIMeGcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/toCjfY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/toCjfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855296; x=1820391296;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FwQ+/z67uKNrbquh4q+/vU4BtkvT+ruO62X2PCRE4Ew=;
  b=H/toCjfYdHW5YY1p5d/Coy07wSJgJmrbDpc6QLWGTfcULqfXsZDSZHGm
   qGbQyDSmij3tCg73pxrOvRInXQAr91AfZoM/noAvcVBmOnTzniy55ggvk
   XtAlwo3v473XQDLlB0LM2EUJQUOEnYbMGzxtlzoW9EeF0hztgP8HqNw74
   Z5ZSVMSZByxEnGkaHft32jWQHU0xOiPIQd2rpH/62B5BniY19K0y5VKcp
   2/WfbyZJEPxG/Imf6NYBRdkWwt9z71ov9Knscz569smztVdvZ4DcEAN4q
   HrLffi4K+btw5VdKgurxWFzXK0MMKNgfiVQTKjR9M3kADyELvNKx6A6H4
   g==;
X-CSE-ConnectionGUID: kQQGTi3xRfCAdgi5Epw4uQ==
X-CSE-MsgGUID: kIHWd1mLQAO6nI7/QhCFBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88399804"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="88399804"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:14:52 -0700
X-CSE-ConnectionGUID: JJJRsYsrRSC9YxEpwRuNdA==
X-CSE-MsgGUID: h3/IxmxKQd6r5P1ila+tJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="268353672"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 08 Sep 2026 01:14:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C08D499; Tue, 08 Sep 2026 10:14:49 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/4] thunderbolt: More improvements to USB4STREAM
Date: Tue,  8 Sep 2026 10:14:45 +0200
Message-ID: <20260908081449.3424884-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Alan noticed that in certain workloads with concurrent reader and writer
the stream could stall for a while. These below improvements should make it
behave better in these cases.

Mika Westerberg (4):
  thunderbolt: Write descriptors in tb_ring_poll()
  thunderbolt: Add tb_ring_poll_pending()
  thunderbolt: stream: Do not hold the lock while busy polling
  thunderbolt: stream: Check the Rx ring before task starts sleeping

 drivers/thunderbolt/nhi.c    | 26 ++++++++++++++++++++++++++
 drivers/thunderbolt/stream.c | 36 ++++++++++++++++++++++++++++--------
 include/linux/thunderbolt.h  |  1 +
 3 files changed, 55 insertions(+), 8 deletions(-)

-- 
2.50.1

