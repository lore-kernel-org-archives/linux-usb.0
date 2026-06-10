Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E295835FF6E;
	Wed, 10 Jun 2026 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077854; cv=none; b=Tq1+qLupUGq1sQEGciUSp8EL+XX7genXs19rFvTkpM4bVuaWFUlD/fpEUkGQQBUaOUiPkItKyFIwv39w+LFL4T9BhXUnpJHg5ll45f/DdpKeGiEmL+igbNVYr5fsj1isnghDjwUmVbQmJkja8SdYeVD4T/WG1VUV0OngWm3+qvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077854; c=relaxed/simple;
	bh=sErN7iWDTMj8q17Y4b2yvF7WO12TXVe/wdRKuwsR5F4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i3KSaE3zkUcSmWJrqrdMatWz6B9Xt8LH5YPrznvptO1WGrgeYwsXq+LRLLbb7VeGTjzpW8Slz5eTYrd/6wFv3bZ65pmzKiHBhotu/6UeQjGsPV0lpCTCF7F2AsVbdxe1bBWIrkCXFUgnFnfjHCMuysoTz05V/wksKEdB55U0j1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsoTsdSA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsoTsdSA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3A91F00893;
	Wed, 10 Jun 2026 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781077853;
	bh=qNT+ov1yGu6RH2YYD4AuUShjabPXPWG5T8m/uVV2Zd8=;
	h=Date:From:To:Cc:Subject;
	b=RsoTsdSA3J5AYzdCSghOF6zGkjQsDyTGkaj+s5bl81qAvBmPxW7uQTr7V1aNg8XOh
	 Dl8hFp82RKHmroiYZHGo4NYFFeP4AGhBIy69xFb6FNZn6oJLlogt54FVJ/Qry5GDID
	 FLmR3bOPr3wx5aNJQ64rBwhVYmw01kVWNM0Xdgc9osqZ3QPhMimpBPYQ4byMNeeH20
	 4dGLxA9MFW1JsONGOoWXOwoHwkaRdjxSL0UUxDJLwP6ON69yA0cF2i0CgMypYt9V2x
	 9QPYcm3bmXFbQ0J8hsqUs3Rp09wZMXOUhXyfaTCOclQHzVPfYCY4iZmgjQ/XEuFKB6
	 wsljAkpUCVtzg==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXDi7-000000017FI-0tiH;
	Wed, 10 Jun 2026 09:50:51 +0200
Date: Wed, 10 Jun 2026 09:50:51 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 7.1-rc8
Message-ID: <aikXWygu9EdJce5m@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 1938fb9fe38c4f04a3f30bea44f8071c80a63be4:

  USB: serial: option: add usb-id for Dell Wireless DW5826e-m (2026-06-04 09:05:58 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc8

for you to fetch changes up to 96d47e40bf9db4a9efd5c8fb53287a508d165f14:

  USB: serial: kl5kusb105: fix bulk-out buffer overflow (2026-06-08 13:43:10 +0200)

----------------------------------------------------------------
USB serial fixes for 7.1-rc8

Here is one more buffer overflow fix.

This one has been in linux-next overnight with no reported issues.

----------------------------------------------------------------
HyeongJun An (1):
      USB: serial: kl5kusb105: fix bulk-out buffer overflow

 drivers/usb/serial/kl5kusb105.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
