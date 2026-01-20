Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FA43EFD26
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 18:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932730; cv=none; b=UwXYqdkqXF/oKsCJUxZ5FU3Lk14ZFWhvMrIelyl51KLMALIFwkB6xKASswpHYRI6STkpYdrWRZ78a3eAln26Mqi29Bx39TuuYSIETOjcqDGOZcdoXEecRaMmI1Ooc3whS7zU4KHqEIf6H+52sf4na/WHHkwNaSJL8yrOl3VnbkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932730; c=relaxed/simple;
	bh=Y6DpfPXbLuWxeb7qbOTejbLQaJdxJ7FHVwcwfVbD/H8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cs8j/Zwq6vDegQYtkpxDpkMdKh5ivtWuzuH7fEFyFOS4lWm726UJcJx4Vrhj+rN6aq6y/6/9/SGr/iayOOhynktAL6F6bshNzCjyToKAgqYlLExCWvJhiCXEkN1s1nLMsyt3MUIm+Wy6Wv0dbPNjiMF6rHraHyoRqBzRoztIrNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGRv+MdX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGRv+MdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768932728; x=1800468728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y6DpfPXbLuWxeb7qbOTejbLQaJdxJ7FHVwcwfVbD/H8=;
  b=bGRv+MdXx9Eki9FFiGzaaZ1wsNrgyquSVprSQ15tBajtKaVxV892a5wY
   7Qejh+y47ar/YHGFxwhuQ5XIb3F6Wq2TcotGWMo99kiDLVV67qxWohmpO
   rgrpR17WTZyNPmRn0en3zCzBBXIH1Wkg19k5Si7VEsVGnkyFMKcwv+3WV
   MjKgRaQkXLGQpBtZs5mqr56ThFezZBvzRq2nqLaBB/vRj4g8sYEaa7AJL
   EdwuoAGpFf+1AsDKFA33FVyBylgwElRd4AozZ7CZ1+WQPy+4USVnUwTsM
   qPH+oARaZl8rWHEQWsk+7l7i4qBKM9sm/VygEoK9BnBlGWdhV07rJtSQ0
   g==;
X-CSE-ConnectionGUID: 2w3ifgd2T56yQh0bYEh4CQ==
X-CSE-MsgGUID: SGeGEHJzR5yyZUzHq7zsuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70055574"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70055574"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:06 -0800
X-CSE-ConnectionGUID: hXyu01HhSpmg92XL9DB2pg==
X-CSE-MsgGUID: D+jLe+4BS7WRK/M0GhGgPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205997428"
Received: from abityuts-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.215])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:04 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci feature for usb-next
Date: Tue, 20 Jan 2026 20:11:44 +0200
Message-ID: <20260120181148.128712-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg

This series for usb-next allows users to modify the string descriptors
presented by xHCI when running in DbC device mode.

Thanks
Mathias

Łukasz Bartosik (4):
  xhci: dbc: prepare to expose strings through sysfs
  xhci: dbc: allow setting device serial number through sysfs
  xhci: dbc: allow setting product string through sysfs
  xhci: dbc: allow setting manufacturer string through sysfs

 .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  42 +++
 drivers/usb/host/xhci-dbgcap.c                | 259 +++++++++++++-----
 drivers/usb/host/xhci-dbgcap.h                |  39 ++-
 3 files changed, 262 insertions(+), 78 deletions(-)

-- 
2.43.0

