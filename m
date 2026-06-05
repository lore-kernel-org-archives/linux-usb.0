Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FACD1494A8;
	Fri,  5 Jun 2026 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661412; cv=none; b=NTSebPKpzW9MidWW1CPcLRKRDq8Q5sh+W/sc619IYT9tqj9Xw0XzIcfWGvDDcFzSPAQCYjs609HmOpe1E+7IZkjACahCFsp7EKdJD1JqYX95Kp3XX07+qAKNhhctograllPI6B0OauWNQnYLI+aXKJBH7IZK3GfngZVodTNSFoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661412; c=relaxed/simple;
	bh=it9uRo859cDLSv64Aoi6azS4xwRSL+wdwUHjG/E4KRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jVyY8dEqY9Xk2O2Q2DqNM+I+PVPFSRJWQ3TdwUYPTJU9ZpvNWFuBB2/Fa7vYmw0VlKBlcPd6STVFsGjpg4GycuSfwBOzOsAGyqRRzDBlbiZ3CfTkD6KHJ1sRkHQc+RpYkpv8DOLRhJ6Ao+gnUVoaBuieCAz5ITa2N/EiTCEiw6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKGfO7IO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKGfO7IO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BC21F00893;
	Fri,  5 Jun 2026 12:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780661411;
	bh=6mYKT1lHRVqsBv66Ij7vFx+UPi/paUf5o2KoSlA4SOA=;
	h=Date:From:To:Cc:Subject;
	b=AKGfO7IOBrTt52cBsWUXtbWJkQQtXJSceRHM1oGwcJSof2Rb05L8FvO1o2rC1F0y7
	 g1lN2VsewAgFZfJKh7aiD5paJwhGQA+1XQy5NgG2dPPwW47z+ev1p/cH+EaRuH+cwY
	 s9TNbxllwjSrvXYoKVCrXZZNqiekhaLdZpSeSDaJzWUnG2gaoOITPpwH4GaEH3DaVU
	 WChtofCAECzYxFM9m19znss2oES1vm3MPLaB0yi6W+CZyOY22w3fZO0bYJgCtMWwdv
	 rY8PqDFDlztmdsKpcV/RsZn7YGdVL32g5+rwm4ik7IuXdBNRZX1IW4KJcMedFdkZmx
	 +kQvefKaJ+nyg==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wVTNI-00000000DHT-2du0;
	Fri, 05 Jun 2026 14:10:08 +0200
Date: Fri, 5 Jun 2026 14:10:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 7.1-rc7
Message-ID: <aiK8oEe-5pUc5s7Z@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit e43ffb69e0438cddd72aaa30898b4dc446f664f8:

  Linux 7.1-rc6 (2026-05-31 15:14:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc7

for you to fetch changes up to 1938fb9fe38c4f04a3f30bea44f8071c80a63be4:

  USB: serial: option: add usb-id for Dell Wireless DW5826e-m (2026-06-04 09:05:58 +0200)

----------------------------------------------------------------
USB serial fixes for 7.1-rc7

Here are two fixes for buffer overflows in the io_ti driver and a new
modem device id.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Adrian Korwel (2):
      USB: serial: io_ti: fix heap overflow in get_manuf_info()
      USB: serial: io_ti: fix heap overflow in build_i2c_fw_hdr()

Jack Wu (1):
      USB: serial: option: add usb-id for Dell Wireless DW5826e-m

 drivers/usb/serial/io_ti.c  | 11 +++++++++++
 drivers/usb/serial/option.c |  3 +++
 2 files changed, 14 insertions(+)
