Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB10B38D404
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589011; cv=none; b=RwwEgh6qaiURmUBMwzcNWl//PrkrGN5CGc4ULnnQkgHh5IjqXZRZtMJ2P2/x+A1OearBaOulxt5j73O/LBrgiPQPh7CZEXoBGgmc/+d5eWFa8V/7UJB09z6/9GHDXCLU4L4U5eCO+ot9QGEYeA16j+TtDwCpytA4FdmSeWULFmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589011; c=relaxed/simple;
	bh=i50WBkO9qQhVk73lMCQz3mNHab+CSgyhW6A8is+UYvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V4YvFIhi3VDwja/2rT+A09cErYXa4NTC2sqXFGz4FQ9ZEnfBAuuCK6dFFvdPdgv+Nm3df8nkBFT+ejfY5CQXf1d80l/OXIhn6L4dx54e5WRhJ2nYQuf/bszAII79WqfJHvhsmf/TC26xFOhB8BqxWwQJ0HZQ6F7DtDyALI0iv24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PX/w3Aut; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PX/w3Aut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589005; x=1810125005;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i50WBkO9qQhVk73lMCQz3mNHab+CSgyhW6A8is+UYvA=;
  b=PX/w3Autu81SHyIAwUxbrYd33pusPx7fCcD+FtLnQpg3wYsBBmjhyWXE
   4YvcvZ0meNXIytcH46bQ1kj+kGQ4O7JwfmBz15S5Du9gFmrBavmLMxdRk
   RAnQC7Y4P8NIvFeF3moqDxFa7rYUKIS3E85sacbF4ld/TMQoXmmO5YzOU
   DRSZxNNXVoA9c72LMqIzdo07BLjLFTNcMImwGuYq9rd8mzWlcm4tsri7r
   PdEc8Pbo8Tl8blqf3q7XonIEZiz8NvtJ5S1atUtm6FCqbr796LKUeQN3p
   Fd7LvZuv31uMfXMOUpYV6bIfMbi04DCKEpiLYWODXsv8BKhZec9cuU+UQ
   w==;
X-CSE-ConnectionGUID: UbLCqcYcRWKj5nLoGY1syw==
X-CSE-MsgGUID: EjkHYCggQAe9T0eT2/BNRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950591"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104950591"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:29:59 -0700
X-CSE-ConnectionGUID: +o5Zye5rTyC4HRgVS5OZeg==
X-CSE-MsgGUID: YNqOBFGaSqKa2xsQntt2ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="234692674"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 05:29:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B562E98; Tue, 12 May 2026 14:29:55 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/8] thunderbolt: Make the driver follow CM guide more closely
Date: Tue, 12 May 2026 14:29:47 +0200
Message-ID: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series includes various improvements to make the Thunderbolt/USB4
driver follow the USB4 Connection Manager guide more closely (and hopefully
work better with wider range of USB4 devices). There is also one
improvement for DisplayPort tunneling with more than 2 tunnels when
bandwidth allocation mode is enabled.

Alan Borzeszkowski (1):
  thunderbolt: Improve multi-display DisplayPort tunnel allocation

Gil Fine (6):
  thunderbolt: Fix lane bonding log when bonding not possible
  thunderbolt: Activate path hops from source to destination
  thunderbolt: Verify PCIe adapter in detect state before tunnel setup
  thunderbolt: Verify Router Ready bit is set after router enumeration
  thunderbolt: Increase timeout for Configuration Ready bit
  thunderbolt: Increase Notification Timeout to 255 ms for USB4 routers

Pooja Katiyar (1):
  thunderbolt: Don't access path config space on Lane 1 adapters in tb_switch_reset_host()

 drivers/thunderbolt/path.c    |  6 +++---
 drivers/thunderbolt/switch.c  | 22 +++++++++++-----------
 drivers/thunderbolt/tb.c      |  3 +++
 drivers/thunderbolt/tb.h      |  1 +
 drivers/thunderbolt/tb_regs.h | 19 +++++++++++++++++--
 drivers/thunderbolt/tunnel.c  | 35 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/usb4.c    | 35 ++++++++++++++++++++++++++++++++---
 7 files changed, 102 insertions(+), 19 deletions(-)

-- 
2.50.1

