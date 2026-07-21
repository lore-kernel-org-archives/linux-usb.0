Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D22D409285;
	Tue, 21 Jul 2026 07:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619216; cv=none; b=YN8ApY1Ol7MVlG6Clo8evaCggKzXUMQ3RLTz8RBzQLeyhmbmln6EU3gvbAMgVMVnk8TLEGA+O6bZBavqBQJ+UBMzop10yEhhh1NCP6E0/MUlX6EbANTOi+ZrmtItaPL+vNQsf7Pq7fuTrENmBiWPPqUh31/WUOwn4hPHkygpEi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619216; c=relaxed/simple;
	bh=JIsCLBfC3CtkqpA+/aRQNc0gV4QtSTxdBNKzAtGGZGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deEHc02NPMDbK8we4btbTKYG44tE1bh14YV5mYsYJVOFq8lu8VY1i9uCaVhxDpWOJyky9POpCGYZT7m3OAJz9GCJSp4bDdHFRxxpGrzXS46MbdMsuUOmk4uKwHTg/ncE+O7sVOOtTU342+2TJdDBd2n2avZ5Xrnx7DvELyzy3PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fncu7tEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fncu7tEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C444F1F000E9;
	Tue, 21 Jul 2026 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784619214;
	bh=zJo9hGL++xmHlXE1dR/sfOdWE10LCAu7YbTJMpDPVaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fncu7tEZ4Cd7YuqVpIIyx+KCWX79MLGHCZHYaRqf0kOnIvaCoxbgl/PrB5Ui0WpU8
	 XjWAqbxus6ZZ+46R0sg5W+K6tZwoVhcg09qOQitKChaaa/3jG65QSaXXMbAu/nGO+M
	 E3FFQgJ0ImmkMfMb7RubJxUniRjAuAP4LVYMEwzc4iXZPqFd52vwDeNTA8o/vx0ymC
	 /AMJHx6pFzFOT7Q+SfHntrvFcqjLq1TI2qWz9u747apk7gCnS9Qc9gPXm21Q9SG6wd
	 Q5CbMd8pX9vEVRgJv8tIBWlOGdBM20E5zJHwcxx9jC5vu3rzdXc/S/znVxZbbvZIaY
	 P7jAURhiqI5Hg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wm4yq-00000008vm0-0rfA;
	Tue, 21 Jul 2026 09:33:32 +0200
Date: Tue, 21 Jul 2026 09:33:32 +0200
From: Johan Hovold <johan@kernel.org>
To: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: Re: [PATCH v3 1/2] USB: serial: ftdi_sio: retry transient errors on
 chip-side control transfers
Message-ID: <al8gzIupMhXqWq9u@hovoldconsulting.com>
References: <cover.1782121274.git.naveen.reddy@ftdichip.com>
 <cover.1782201674.git.naveen.reddy@ftdichip.com>
 <37cc6844010da737aeae61e0248fb3e9ca5e35b0.1782201674.git.naveen.reddy@ftdichip.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37cc6844010da737aeae61e0248fb3e9ca5e35b0.1782201674.git.naveen.reddy@ftdichip.com>

On Tue, Jun 23, 2026 at 04:03:20PM +0800, Chinna Mopurigari Naveen Kumar Reddy wrote:
> usb_control_msg() can return -ETIMEDOUT, -EPIPE or -EPROTO on a
> functioning device when the host controller is momentarily unable to
> complete the transfer.  These are transient conditions that surface
> under heavy USB bus load -- for example when several high-baud FTDI
> channels share a busy host controller -- and a short retry generally
> succeeds.

As you described here in v1 of this patch you observed this with an
out-of-tree host controller driver where this is just one symptom.

So this falls in the same category of random function driver workarounds
for what are really host controller driver issues.

Just configure your latency timers before overloading the controller, or
have your userspace retry on errors.

Johan
