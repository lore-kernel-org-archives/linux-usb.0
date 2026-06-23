Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3A63D7D84;
	Tue, 23 Jun 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227347; cv=none; b=TFeLAzdLs23B03VfU8Chyf4WYex2aTHU+IrWbzXXP78F/kbtFSOpBlOhD2W8BBnKMOP8v8Qw7j9gzZLTHm9YX5ko3INFu2RTeSiYoVTn6yiF+HL+tgKh60l47yBckhofbDViymMfsRDGiIj3va4VS6RvwmnNkNs9WF08N3xZXeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227347; c=relaxed/simple;
	bh=htzBhelqQzYITnrrtgVAmNwykzhrdmivD+T7g1u6Krw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRLukhZigraGwmTpUFSBJ7X71yh/IXCzmW4v5k+mpgcBOIYqR+YTt3BbGNCoa/iW1FaNnSbQiiNbrTDDdcxafOa4ak/q+a60SmHkuj+MScL2JudYZd6vfINOAW0tXxXiZWtTycZEzr+R1Wca4Nz7Cvirux2nULdGAMxxqo8TqfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZW38qJ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZW38qJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD1B1F00AC4;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782227344;
	bh=EkZ9ZnZdpubB/+qElg2WSbZB0LdCrTY/VSEHRarwRmY=;
	h=From:To:Cc:Subject:Date;
	b=YZW38qJ9YIVAFeSUzS8xZ3uu40oWlSOdnJ55M2qvLmcGhgVooyaW00OstcPd5r9in
	 NhGMV5EmBd4gH8/1/psGgRxSDLA4xMftKL5pY11xJbayZZs8MKWe/UO8/Nhk/w8eZM
	 BXAgg2lvV/vfo4Vdcfdh27qElX8yQW6ozWpbtA8ZoRO67yBfcs0fxnOIWf+qBFb74C
	 3F4qRe1pdMOeETOwdNKi9Kq9Sh3cZvf0z1h4mj6vkvI24XqmixFk+ugTTrYqUBo8hG
	 MzV6O9VDRMhptRJzRLGzPjYqwdKvmPyuY9E8P+5ZgXqDcJ7jGrtAKBYTAM2qp7RmBy
	 RkhZYw75m2ZgQ==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2kI-00000001Ju7-1DcA;
	Tue, 23 Jun 2026 17:09:02 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 00/12] USB: serial: digi_acceleport: registration fix and cleanups
Date: Tue, 23 Jun 2026 17:08:14 +0200
Message-ID: <20260623150826.314727-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a port registration ordering issue and makes the
driver stop all I/O when the device is not in use, while cleaning up the
driver somewhat.

Johan


Changes in v2:
 - fix broken rx after throttle (new)
 - rebase on fix now in mainline


Johan Hovold (12):
  USB: serial: digi_acceleport: fix broken rx after throttle
  USB: serial: digi_acceleport: fix port registration order
  USB: serial: digi_acceleport: drop unused wait queue
  USB: serial: digi_acceleport: always stop write urb on close
  USB: serial: digi_acceleport: add oob port helper
  USB: serial: digi_acceleport: clean up declarations and whitespace
  USB: serial: digi_acceleport: drop redundant driver data sanity checks
  USB: serial: digi_acceleport: stop OOB I/O when not in use
  USB: serial: digi_acceleport: drop unused in-buf define
  USB: serial: digi_acceleport: clean up xfer buf length expression
  USB: serial: digi_acceleport: clean up write completion
  USB: serial: digi_acceleport: clean up inb command submission

 drivers/usb/serial/digi_acceleport.c | 304 +++++++++++----------------
 1 file changed, 122 insertions(+), 182 deletions(-)

-- 
2.53.0

