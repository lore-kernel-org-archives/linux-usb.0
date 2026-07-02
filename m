Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97784DB56F;
	Thu,  2 Jul 2026 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001772; cv=none; b=QSL1T1Z2uQWdNL+sPIB3RUDjORX+vjeO4w7ALzRCA/E/cPqtrTvkm0wp32xLzDTnpn71QkYjM9cQFr7FbmWp+8or+sto2TU0IDQxDRl+TcYCq8hJ69hVKkWLS5wSplwzHTJYM3QLoGuxudwSAjWHt/YX4HXE0vuHqdqORcnxrNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001772; c=relaxed/simple;
	bh=DRB686cc3pQztBvYjITiP738a6heD1Ie5tqFgnJ+M7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NAlzRjYJHR74zt8DyOk7aU8dQOtQIEGmx1TImz+qFvnKM4Dy2Kf1Yrx1qGrAsqAFiE6l//5U1X/qppyCzhtV7ohd0IPfvUg7KpAEiqH+NRMGNePg2IJsRjPd966AJ3iAD2eXLE8GMsr+O90eWf7N1XpkHrqC2hKoXQy97TZ+5Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeTm1IOt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeTm1IOt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0E91F00A3F;
	Thu,  2 Jul 2026 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783001769;
	bh=e3BBWFg4iK35Io0mWwz6AFuN2Kg8RozrlNCNxnwewCk=;
	h=From:To:Cc:Subject:Date;
	b=CeTm1IOtg3mWxAfxKJOs5Ift8DnN5IwEftP2qWlbYCmM6yr4wavV5L9mn+UxmYxH8
	 2MS6SVPTKiSB0dAQWosVBEbY/HYftYviLEJejjAybuINPF3s9z4qB4q41Fwxs1ogCO
	 XTXcthnLeNsSTycXttYbxPvNoiHFhbZVN4q5YfqO4Ku1Fl2oqnzw/qMVa10XookU+p
	 DWKFmG+3d9knlYCRC+p6XY7cIuWrq1fzB5eULqLqqBKRD2htUBuFhvs+Knwg2/vYii
	 m9Il7CAdQux6hirlC1RxRuk7DkvLeTcFhImzQJmzUasqa34Z+RoZXrpagzUPDCnIup
	 JvN4ZIN+qmgrw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wfID0-00000000NeY-2daO;
	Thu, 02 Jul 2026 16:16:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] USB: gadget: fix device name leaks
Date: Thu,  2 Jul 2026 16:15:32 +0200
Message-ID: <20260702141536.90887-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes a couple of device name leaks in udc driver error
paths due to left-over code.

Included is also a related fix for a fsl driver dev_printk() conversion
which ended up using the wrong struct device, and a related remove()
cleanup for the same driver.

Johan


Johan Hovold (4):
  USB: gadget: fsl-udc: fix device name leak on probe failure
  USB: gadget: snps-udc: fix device name leak on probe failure
  USB: gadget: fsl-udc: fix dev_printk() device
  USB: gadget: fsl-udc: drop misleading unbind sanity check

 drivers/usb/gadget/udc/fsl_udc_core.c  | 99 +++++++++++---------------
 drivers/usb/gadget/udc/fsl_usb2_udc.h  |  1 +
 drivers/usb/gadget/udc/snps_udc_core.c |  1 -
 3 files changed, 43 insertions(+), 58 deletions(-)

-- 
2.53.0

