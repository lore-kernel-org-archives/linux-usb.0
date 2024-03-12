Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABDE2A1B8
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 07:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710229105; cv=none; b=mBTgJ+OGwsSFd54QniTGIUIDPUvag3mg9MjBHvRwxqArZEHNxiW1EADkezds9irCJ9DjhB8pPSTij0z6XM0KDRrWetJ+JNLSeLrUS4U0XaW1tk7h7BJEKB9PXmbn2sCRGyrt71E4dn+o+o8AVDpayrzKpePXKvojKsts3MreBAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710229105; c=relaxed/simple;
	bh=xhWlw0Ps8l8FJGifTClqozhZJbaz9T+pidfcgic+7TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmvFiHTkHE977P7ulMCk1vOLRlEFcaDPL2JMGq3XcPKAop5QuuP7kRgC7/W1EuPm4r3I+csitTkWCEQq98rzcKqmz2+5iIQd09CIA6AXJSlyhpRMxTI9zpuY6uOWk1txQIoXrYH7ivLPjJByl+T+e/rz7IN8BW/MDR6skKj3nGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeXdvMOZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeXdvMOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58063C433F1;
	Tue, 12 Mar 2024 07:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710229105;
	bh=xhWlw0Ps8l8FJGifTClqozhZJbaz9T+pidfcgic+7TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PeXdvMOZRcySBakDy6tsrt3s+69SkWR4OFIiA14WrezcirR6YbO6iQveo5zg/Q9nx
	 3T5KT97PaIH4rUgRtHlf6lH+CLHbdqGhg5iP/Kcp+BBpDZ478pc05RF8cXlyPm5LtL
	 Q2hsAGXLrVBSybmHshrsfgyoA2ZLLhKMtfRaVYC++XfP5U98MPHvK4/4MTBIyf10Mw
	 FJ5Cscq4jgsdIMD3VoIgjUzmVMwMEJZOkDfv7OAmwg5hErednb4KI78xG+7r185HS9
	 VDF+L/WhloGxtLxcQkoRyUf4JrQBNZr5E1bDV/OpmyscxtGyxkUxo4gFLQa1BZhuNj
	 sP891x2bAzQPw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rjwiU-0000000070H-3LbZ;
	Tue, 12 Mar 2024 08:38:31 +0100
Date: Tue, 12 Mar 2024 08:38:30 +0100
From: Johan Hovold <johan@kernel.org>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: linux-parport@lists.infradead.org, linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com, daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com, reboots@g-cipher.net, mike@trausch.us
Subject: Re: [PATCH 1/7] docs: driver-api: parport-lowlevel: clarify purpose
 of PARPORT_MODE_PCSPP
Message-ID: <ZfAGdjPgNh2GrVXt@hovoldconsulting.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312055350.205878-1-alexhenrie24@gmail.com>

On Mon, Mar 11, 2024 at 11:50:26PM -0600, Alex Henrie wrote:

Please write a proper commit message here explaining why this patch is
needed. You can keep the link if it's relevant, but you still need to
make the patch self-contained.

> Link: http://lists.infradead.org/pipermail/linux-parport/2024-February/001237.html
> Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>

Johan
