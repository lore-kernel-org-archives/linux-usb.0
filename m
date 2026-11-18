Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006291;
	b=fyXKDDyDZ+sO8vAEE5gTTyf8XHOUFrfcastBQCB/wKAKKpAxjfMSjcWAwPbjP02mGYu6
	 ne2tBbHThfnJCUHsWeoIvgWubAuek1d893q/joeseoE63WXOZqRIHrLSPD2O3HYustAWs
	 PRk9S1W0vuire1S5+DNvO+b8AE1gURYJ8xo58+YG/jZd18A5UBdIhhITBrhhFv2GMebwK
	 wPJEaZJGPHXo5nZelQj6+mDaFuQwcRixwOOiN310HMDzLoqEegim+QBpB2faHQ45HlZiH
	 zHcLrLiaIWA7i3CfxanFx8h4Hv+aRF8pVfhj/3zjLu0sy2EdWEMnseE7+0sAs3An9KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006291;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=x55O0XnU/XedQlUqxHfkoPOkMbZeeQjnbIlAbK3Ka+c=;
	b=Gn2ckdQjDJG2KNZz/AsEJk5+F4rtKbzuCiIZ7Vck4Zvn9lq+NbVj6Iom/qhxwOSfPPN+
	 1MFu/uVg5/uduMK+6Zgi0DBDfQuBCXN8oMivclQZxXo2IVNbXUbbiPAMJwB06PrJ1UcPN
	 gJY1TTqWkB/tKT40W7MqI7P9t4/Fllz6cNiB9Ej2rcZakY3MPs56ae7LB/EtYF75+ROcs
	 yVHRki29ee0P4PF3uOsldEQCX7Yf+6qT0SOZ50PTNc+/k4/y9yfg1/o8uSmyH2U6ccI3H
	 LDm50aXRwjypHc4l3wMauD3Hj/FdJ4AK7mttEGCT0hx28W3F4swf7QCgnyBV0HdrKlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dtd+1H4G;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C1606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dtd+1H4G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795006291; x=1826542291;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gg1Jjlq6vgWDwzZXQVUnFChKlntEgHh4DSo5wUR7k/M=;
  b=dtd+1H4GSaxPFmkv3gQ/Z5prvrUA4b3NkxH88sDIUzJq+DeGnjmUcWa3
   qxJX0FkbBGYowLbQUDFYbzhu0mXY/xnSWOLNw0X1GS0fDNYqwbIPrz3BY
   qvRqVtFGx+SAm9EP7juAq3BhfTPz3v8MZVceqoFjLe1HjM7shGnfPhViZ
   k03QYp3BnDF3nV6fsG2qfCE8DZWXu3E7E9/EN79LeSZsx8TfxW5PJCoj1
   stL8iKjd9pLF6HCgYWmbZ64NBCvkzOubZpbs6tPS/Z4WP1Jhp2uTdmpyM
   PQOeLXTpXAuwEwhW/7w4B/Iw/S+j1BFWSJIjETY0OLWL7YzVU5+GxqkG4
   A==;
X-CSE-ConnectionGUID: VPavLkqnRMOeaHmkMFsORQ==
X-CSE-MsgGUID: cRRCPvqFQ8yH/uMGc6/9Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3709092"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3709092"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 04:51:24 -0800
X-CSE-ConnectionGUID: qM8lwdQoSxuDW5Dg8+yIGw==
X-CSE-MsgGUID: ri0S34qRQnqD2Hfaqn1NZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10476201"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.233])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 04:51:23 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: quic_wcheng@quicinc.com,
	hulianqin@vivo.com,
	selvarasu.g@samsung.com
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH 0/2] xhci: sideband: fix use-after-free of stale virt device pointer
Date: Wed, 18 Nov 2026 14:51:07 +0200
Message-ID: <20261118125109.1429538-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Hi

These two patches attempt to handle the disappearing vdev issue
while sideband stays active.

I don't have real harware to test this on so all review comments and
feedback from testing is welcome.

There are still some gaps in how xhci driver uses locks when
disabling slots and freeing vdev that is not part of this series

Thanks
Mathias

Mathias Nyman (2):
  xhci: sideband: avoid use-after-free of stale virt device pointer
  xhci: sideband: check virt device under xhci lock when stopping
    endpoints

 drivers/usb/host/xhci-sideband.c  | 141 +++++++++++++++++++++---------
 drivers/usb/host/xhci.c           |  55 ------------
 drivers/usb/host/xhci.h           |   2 -
 include/linux/usb/xhci-sideband.h |   4 +-
 4 files changed, 101 insertions(+), 101 deletions(-)

-- 
2.43.0

