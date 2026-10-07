Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB40494A04
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 11:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374354; cv=none; b=cLfiXzlDRxfihEKkI5G8RkRNwRUBGLJfH6sH4zvkTs84WkSxsOGyw7FKvMRzdQHDAARrS6uv8lKdymy82co9sMoRal6kb8tkOx10ydzmaruaO24q5Agnw5EVMKjbTfay8wBuo3BvuCUfkbIQhFSD5BD6FeSJC7qVop9LZ/vo40s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374354; c=relaxed/simple;
	bh=Hi9zv4AdLRyMi1Faeg5ofy7InuMRnFQ7U+WrB7F49Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AMdOODsDpZ5qNlkfHc3OIkBqWwxGtfy3CsUt2t9K4VRVBxy0D5c1x4ze4RxRtzT/1t0qJjlPgiKTsM0aA/MeAI5LnhVg+ATPEbUZ5zoLz6Jw4IamNGQC7D4qHJwsQojWudvPf4GOvzVnWPQzUtlPgOBlFhNJGBgWupUFv5D8aow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/KjXc9y; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/KjXc9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791374343; x=1822910343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hi9zv4AdLRyMi1Faeg5ofy7InuMRnFQ7U+WrB7F49Sk=;
  b=Z/KjXc9yMRie9HobsIsA5LR0aKczJl84vzlO8dkZmh3Ye3t1ax7tuUW6
   M6OQnewTw1NTjRofiEt0tV8KyTP2BYhi2PqQBcNxEsyOHXYzAJ3oulQbw
   VcqL1O+ICFcEb4mhRLYFi6GMlftfwc7yeOcPsAMTwKWQt/c3ZyfuaWAbE
   RSgilcUyfvf0ZNYV240O9fN8nqQoslqgCUshFupDegjOVDk/dpKo62e6H
   a23LlzGlMXEFMQ1bJARD2YANgBD0/EAfkHDGhewF78DLjTwGHlB5cPcHn
   y8ZjD9OwjSHD60p5tYlkEBIKM10jjGe2Sa4FBXwN2PYL9Vg0K1ZIAIqEM
   Q==;
X-CSE-ConnectionGUID: jVLtHmy4RuaQKy0L538xiw==
X-CSE-MsgGUID: QaZQ1eTFR1qUxJspW6e1VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="234535"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="234535"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 04:59:02 -0700
X-CSE-ConnectionGUID: a24jHWtjSG2JkYT+h43Phg==
X-CSE-MsgGUID: bO2U0fUqRfKMzDfV4f0Avw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="282236356"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 07 Oct 2026 04:59:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4732B99; Wed, 07 Oct 2026 13:58:59 +0200 (CEST)
Date: Wed, 7 Oct 2026 13:58:59 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fix for v7.3-rc7
Message-ID: <20261007115859.GR176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 395e9f2967a7ac6898026e8f136c369805dc2fd9:

  thunderbolt: Disable CL states for the Anker Prime TB5 dock (2026-09-28 11:34:48 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.3-rc7

for you to fetch changes up to 96a8479804e3f7af43e639e9df39f562f1a75fd5:

  thunderbolt: Do not RPM complete unrelated subtrees on unplug (2026-10-05 13:31:20 +0200)

----------------------------------------------------------------
thunderbolt: Fix for v7.3-rc7

This incluces a single fix to make the runtime PM completion complete
devices that are actually part of the domain. Needed for firmware
connection manager based systems.

This has been in linux-next for few days with no reported issues.

----------------------------------------------------------------
Jonathan Gopel (1):
      thunderbolt: Do not RPM complete unrelated subtrees on unplug

 drivers/thunderbolt/icm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
