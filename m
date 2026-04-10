Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DE3CA4E;
	Fri, 10 Apr 2026 12:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825063; cv=none; b=ocdOyY2ZsU3rZKJ9K2NWXJeZYimwbta2ulxyd4dRb5mmy3LaZP7PrFDoZt/7XMAx9X5hGcvJ0C5kJuMlEZW96N9mpGfhbcQLLXx1+/XT+RQj/fAv18I/8QZMW5G2qL0S7V2kp+EsxyBMRKpeZSMNYwEU5/05gMaBFfiLJS6v9dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825063; c=relaxed/simple;
	bh=VFbaYhmbD7iLzoYfPC2pmu/ZD1mH/qbppVKe9jNhUM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0gQSuHAXaOTORDOzSrpoIgr948Lox5Ia0LD0wVsvay+/bTeIheJ4b0ei/+w/ODja7tibfoMwd3RzD6WaxFH849fm3k8h7P2lF51CYTBIQTAJprXm/UCmM/nHHWPrv7nA+Uvy7q1BtOGsm6aM/ZG2eomHTD2GxZpw9/wHTJ5EfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6HXl4YB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6HXl4YB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E70CC19421;
	Fri, 10 Apr 2026 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775825063;
	bh=VFbaYhmbD7iLzoYfPC2pmu/ZD1mH/qbppVKe9jNhUM8=;
	h=Date:From:To:Cc:Subject:From;
	b=B6HXl4YBp7MoFbTsjZYRkgaBkIBKDrUwz+MzOuEqTfh4jnBMudQTm9PL95q9wxU0z
	 5cWqffMWW/IS/gPIYsxOjBq8cSkxCw2QkE38qsbREqNtlVVuFnlqVOwvOmwV/okNxL
	 AouQopD7ZZBT9VpWArpCBWJK98pki3OgZbPfv01TxnPFwr+o3N9pu5HS+kExRT3760
	 N1HDuv1jUYhEexCATfUDUPWEmOcxdqGh4PxLNcKqvh7IW2yYs+2dD1Ruw8IWBW72Vn
	 VN25wdV2608cW76eXOeogzWJat2xs8W1E+7bCFJemmhDeWy0SLECCZEg+k7bG8Zhqy
	 NcPaBZyUNYaXQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wBBDh-0000000017V-0HF8;
	Fri, 10 Apr 2026 14:44:21 +0200
Date: Fri, 10 Apr 2026 14:44:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial updates for 7.1-rc1
Message-ID: <adjwpTq07DQKRqD2@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:

  Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc1

for you to fetch changes up to 37d9c4c055c3b3357c61dba2335ab21340e33553:

  USB: serial: iuu_phoenix: fix iuutool author name (2026-04-08 09:37:43 +0200)

----------------------------------------------------------------
USB serial updates for 7.1-rc1

Here are the USB serial updates for 7.1-rc1, including:

 - use strscpy() instead of strcpy()
 - new modem device id

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Ai Chao (1):
      USB: serial: ti_usb_3410_5052: use strscpy() instead of strcpy()

Fabio Porcedda (1):
      USB: serial: option: add Telit Cinterion FN990A MBIM composition

Thorsten Blum (1):
      USB: serial: iuu_phoenix: fix iuutool author name

 drivers/usb/serial/iuu_phoenix.c      |  2 +-
 drivers/usb/serial/option.c           |  2 ++
 drivers/usb/serial/ti_usb_3410_5052.c | 16 ++++++++--------
 3 files changed, 11 insertions(+), 9 deletions(-)
