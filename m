Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8B13E275E;
	Wed, 20 May 2026 14:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287961; cv=none; b=aCI/zq3nRn2QVH34fMuJL3ACBvFHM8hzIHEahA+/NM5aFGP5+P8nujxqzXc1C65Nazm05yD50fg4RpsqNVd62nKFteu94CfwPtdViTm6m4xFh6Qx/vjf8cDYqhPXJpeHtRwnHRKc1IUWjrbN9UB4ojZIIGbqYbqimFD3cSPRnXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287961; c=relaxed/simple;
	bh=vlh8rrCuQYOeEfOHHA17/KcOHU7PqIW1nX7kKryrGW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mp+nYNwpr1CbPI/EXtP8xYnk8deYfjXQrA5mZfRxsI66sxOj9m8zVEAYd3tKA2Lt2HOSJLoTSO8YY0J2S8XJdp+E+1rJWqSFv/ZSztHrpjki4mpiom+xffNmWTC4TA0TOE0+umxqWnLx5PI/gtGazX+LwHmwou3fPv6+bfWlJIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXOp5Pzd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXOp5Pzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164E11F00894;
	Wed, 20 May 2026 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779287959;
	bh=bj0PR41XbeBBBQXDA2TrM+nyg2UWlR1kDFijVrUgXZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WXOp5PzdZDaEhI/azlyxAIGtCSTCtIWCD89jVzy6EO1prtSKQ+2oyyvmg8TKpTmHJ
	 cXsknuriXqmZqXUaoGvd1B+acihYMuCxU7yjVGDh9nJvQ9N8d4qMCRo3gVm3RlW/JZ
	 tCg+dcVOm3ZPSIS8m1VMMU/LtMxjN+Lso87mJZZJNfn2d17gLhbcZLbiACrn/qj0zI
	 87eGMVb63FqKBp/Q9fz+2QXZh2EERU+9d8xFyxIHuzaIY7SJd8V5FZlx0AOztBkyPL
	 wxppxSUP/yEbmAuZE79ZjrLBMmugqAi1pa4GPU5d5cCNJBx+J8Gt7+R8RhXroisapY
	 dVslBX4nVO4AQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wPi4r-00000002vyU-0GNz;
	Wed, 20 May 2026 16:39:17 +0200
Date: Wed, 20 May 2026 16:39:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: mct_u232: fix memory corruption with small
 endpoint
Message-ID: <ag3HlaNEJvTsps_v@hovoldconsulting.com>
References: <20260520101452.657643-1-johan@kernel.org>
 <2026052038-nemeses-bronze-b08c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026052038-nemeses-bronze-b08c@gregkh>

On Wed, May 20, 2026 at 01:16:49PM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 20, 2026 at 12:14:52PM +0200, Johan Hovold wrote:
> > The driver overrides the maximum transfer size for a specific device
> > which only accepts 16 byte packets for its 32 byte bulk-out endpoint.
> > 
> > Make sure to never increase the maximum transfer size to prevent slab
> > corruption should a malicious device report a smaller endpoint max
> > packet size than expected.
> > 
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for reviewing these. Now applied.

Johan
