Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED53EB11B
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170431; cv=none; b=iNP2qVNmMod2FebKli/Szc00rIh0GHg9c3JOVu0kj5E0XBQ9Aty2vmWw062FzHXvCCllvCs+UjfbJnkKXuk89NtB8Fs1GvWrZ5q3vArzS9qcx4qozUrGwMY7s8fy+zB5J8+v33B9yFWLthh6IDplkS4YIxazfZQpIV4rIx97qrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170431; c=relaxed/simple;
	bh=l9gSQjgJ8e2rc63f9u8yrYula2L7pCcHzESFZXpmVmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nr1hUSitw/urLhpqEU2ltYNi8WPhOJfogSyJmWipwPIE+kytoIeAFIb6TBf0HvPnp/7ZvhhJvQ2ipOO6N0ItNOWsQqB5y+ZUWIbZAzETh0/Kq4iTpv69/AeUH29BGjzLwXG1p6cQUIfGBQsbMQqhfFmpf3QDEWBQxwVWk0gyaOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZ03AFJP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZ03AFJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788170430; x=1819706430;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l9gSQjgJ8e2rc63f9u8yrYula2L7pCcHzESFZXpmVmo=;
  b=HZ03AFJPd0XkcOxS0CM87KVTuk6aq4m2lDjgIIfLcMzDwOMw+Kydp1Nl
   PuRwMOsGesmR6QhhvjXoU22zNtX+KIAu8ZQlL/ZqKt9X1Ajad8wKjG/su
   vlesQn/oCcB2VWq7NF9HFeCvRw6CP9PjplJ/MgIbS4k7PhwTj8nvH/bU2
   mFKkpvMHnOCAJ8xU9mcRa+tqitIkfLbT8jguXxIYjyyLPNGNyItcabiXO
   C6cLJELGTThjQA1iMHbkDhc0cSa1smxH7G4nNwKIDeMxlUPqelUNZcn/h
   s5CugRFCBdc32EnsgieJayPnUqxiVQljjzYaLy4uwO7YsTLOXh/TOm1Uv
   Q==;
X-CSE-ConnectionGUID: 9Tiac6/FQfi0dp1tDTF3/w==
X-CSE-MsgGUID: mx57dqSbTJSMKwI0xCClLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88585121"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88585121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:00:29 -0700
X-CSE-ConnectionGUID: QNmV+kVXQdeLeb5LIyGstg==
X-CSE-MsgGUID: 0KbFoPrtT221YthHRYkQWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="268197129"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 31 Aug 2026 03:00:27 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4B6D999; Mon, 31 Aug 2026 12:00:26 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Alexander Fischer <alexander.fischer@kait2en.org>,
	Andre Eikmeyer <andre@negmaster.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v10 0/3] thunderbolt: Add device links for Apple T2
Date: Mon, 31 Aug 2026 12:00:23 +0200
Message-ID: <20260831100026.1783663-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Original cover letter:

  This series adds support for Device linking on Titan ridge, and Icelake,
  which are used exclusively on Apple T2 machines.

I went and did some changes so wanted to check that these still work on the
Apple T2 systems. I dropped Tested-by from Alexander Fischer because these
are not anymore the same patches. I would appreciate if you could re-test
these and let me know if they still work or not.

The changes I did:

  - Make ->add_links a NHI operation instead.
  - Move the check to nhi.c instead after we have selected software CM.
  - Split out add_link() helper that can be used both integrated and
    discrete case.
  - Link only the matching PCIe root ports to the NHI that actually tunnels
    them. The previous version (v9) linked all four for each NHI so there
    are duplicate links. Each NHI tunnels just up to 2 PCIe root ports in
    Ice Lake.

v9 of the patch series can be found here:

  https://lore.kernel.org/linux-usb/20260824184305.1234-1-atharvatiwarilinuxdev@gmail.com/

Atharva Tiwari (3):
  thunderbolt: Move tb_apple_add_links() to pci.c
  thunderbolt: Add device links for Apple machines with Titan Ridge
  thunderbolt: Add device links for Apple systems with Ice Lake

 drivers/thunderbolt/nhi.c |  34 +++++++++---
 drivers/thunderbolt/nhi.h |   2 +
 drivers/thunderbolt/pci.c | 113 ++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.c  |  78 --------------------------
 4 files changed, 140 insertions(+), 87 deletions(-)

-- 
2.50.1

