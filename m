Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620671;
	b=pTwXDsA64q9B8NPO6OtexuFcu9G8dHH5+gaq0Ji4bYfKGBy4E7fLdU9trq233GVvWqDM
	 8GHC/cbLF3jHhiWFgT1Ld1F54p8RezhxBkUiGRv1XTNh/HWfIk01O9GW+OC3yZCGKaucu
	 AU/xnTpQhwRWc8tVOPMtj/cORSblBnqzwBzGstc1rhT7jgLI0CRNFcasbDdVu0nPijz0D
	 bFokMRsaKohMx8GzuQoXbGLLkHJj3UzF2iEpE+v8Vo3gVZG+P5LUU918KT5gk1NqAlbiQ
	 AOcx51XklSUlxH5asCeW43VgJ83zu88VtkvmiKJgUJrlhwwoMVUgXlsR8SQbChM5xMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620671;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=shwLw+nmPmFjnTOD5iXPVhRTHVmc+MRv6B4Vbk+9S3E=;
	b=2aUG0IhS9mBYBXAfTChvkr318gX07eQZvzW+YbO6IOHBh+huj9y8Y52GCm1Aq83BQbue
	 THHTVnX71mCRCUJTrD5fjvomKWR9fziNkhNtt7onv2WxQwr4xmFxVyFpkbORQ9si1kzJ4
	 AVoAX5EmFoFGuE5wsjcN+Cw5ab0hZlplcrL++zMQuuo9nfVBT26ZLkj/w7iQ382ouiPyi
	 w+LWsnTURTjTYAyK7dtFFMN9rNBFFTZiPmqZEdUnGvxg1HPHi9fxaoSlLw8v15Lbhl6tn
	 DDAnmr+2J6CXIeGNG1WNNj/2D7u3IAkDuLGAV1OJORZmMRyfjHEvh7Nb7xNtjBnUhbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kFHif1pm;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1815606A327
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1815606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kFHif1pm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795620671; x=1827156671;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N7cTXYo8g1EVHIxBTelvWUHPfL55jS2f02thEFBDo/4=;
  b=kFHif1pmljYyyXMAUR1iWwyOPnfo0EBo81vwlrmhfrjaoukqcuy5kOZ4
   cw2C7EKOqBcRet2Zjr/jVIfjU4VVpqiZ5yeaEusThy5pPX+D5MqxDhDcc
   7JmWmXz9HkewjeKswtZ4euV0SdFadpm/56JwgmD2Hi/VlPRxyVVPYdUUA
   52SUIkkg9kwHqrxtH3J0SJEz5APDzHVaKlh4zcT0KRthiEuL1gx7dOqJV
   hyX5fs1LlBFaY+x/vCsZ5VeybW3JuuRPa8Yq/4vlGuZ4Tcdl1LvICKv7Y
   ab66lvmtCrOKblUNFNbrX98UdWOsjB7+Bukd6TQFxqWszWV/5sRb/6H9H
   A==;
X-CSE-ConnectionGUID: TBXpkGzKS/Gp/mth+Er6Ag==
X-CSE-MsgGUID: rfZOqCL/TcWSSgS8+q3TwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4408229"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4408229"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:26:27 -0800
X-CSE-ConnectionGUID: oVnIyoDxQSyl+21gBnF0Dg==
X-CSE-MsgGUID: r+g/FBV2T+2K13puIZEhJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13938531"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 25 Nov 2026 07:26:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0779198; Wed, 25 Nov 2026 16:26:23 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH 0/9] thunderbolt: Introduce USB4STREAM coupling
Date: Wed, 25 Nov 2026 16:26:13 +0100
Message-ID: <20261125152623.456054-1-mika.westerberg@linux.intel.com>
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

Hi all,

This series makes it possible to "couple" streams through host or device
router lane adapters. For example we can have topology like this:

  host1 <-USB4/TB cable-> host2 <-USB4/TB cable-> host3

You can already forward stream from host1 to host3 through host2 using dd
or similar but we can also make direct tunnel through the host2 host
router. This does not consume CPU cycles of the host2. Same can be done if
there is a device router where the hosts are connected. It will take the
shortest path.

The first patches are fixes that the rest of the series needs. The usage
steps are in the last patch.

This applies on top of my "shared buffer" series here:

  https://lore.kernel.org/linux-usb/20261119171232.1616316-1-mika.westerberg@linux.intel.com/

Mika Westerberg (Intel) (9):
  thunderbolt: Add and remove XDomain services outside of the state work
  thunderbolt: Unregister XDomains when the domain is removed
  thunderbolt: stream: Keep better track of the HopIDs
  thunderbolt: stream: Validate the ConfigFS group name more strictly
  thunderbolt: Allow DMA tunnel also between two lane adapters
  thunderbolt: Add KUnit tests for lane to lane DMA tunnels
  thunderbolt: Add tb_xdomains_enable_paths() and tb_xdomains_disable_paths()
  thunderbolt: stream: Introduce USB4STREAM coupling
  Documentation: thunderbolt: Document USB4STREAM coupling

 .../ABI/testing/configfs-thunderbolt_stream   |  82 ++
 Documentation/admin-guide/thunderbolt.rst     | 119 +++
 drivers/thunderbolt/domain.c                  | 104 +-
 drivers/thunderbolt/icm.c                     |  49 +-
 drivers/thunderbolt/stream.c                  | 971 +++++++++++++++++-
 drivers/thunderbolt/tb.c                      | 150 +--
 drivers/thunderbolt/tb.h                      |  28 +-
 drivers/thunderbolt/test.c                    | 558 ++++++++--
 drivers/thunderbolt/tunnel.c                  | 171 +--
 drivers/thunderbolt/tunnel.h                  |  14 +-
 drivers/thunderbolt/xdomain.c                 | 163 ++-
 include/linux/thunderbolt.h                   |  14 +
 12 files changed, 2108 insertions(+), 315 deletions(-)

-- 
2.50.1

