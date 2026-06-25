Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FE63C1084;
	Thu, 25 Jun 2026 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782369668; cv=none; b=QYtQO3fXkTvvtz5OA7crPTPyVj9gWsRBGsikzNCCtgF+B7HE7r4i9cg7FwhtjuT7u9RffGX1x9yagLC8CZaHG1UYQelqRjwc838fJo8y1P2GQDk1lR92ttMg/iU4uak69lVU9smnchnL38PjIYTF/xUn0eOmlGaSPa9Cm+I2nz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782369668; c=relaxed/simple;
	bh=Wu9V0DWdfJXfA5hMOXGA8wn6Iv3eq16S8DufFK97Rn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ews4y29Iq5Y+FxCgaqzsw5zpEFgaUQwLPuwzCiNHTdJoAz6KfhjNYqlpVFKQTxsndAYugssKr1g8vgoBFYRgQf88duRaQyvG/xk9oHZXdVnfxfaKTguJqvKphyzeZi9pin6N5UWOg4qeRe5q3+hJ2rWQKi9BrSPp8NuHL6TJgJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEGxiQVO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEGxiQVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE0F1F000E9;
	Thu, 25 Jun 2026 06:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782369667;
	bh=sJ3HROvQO0qsU7vNNVJW59u6zdwuLz6SwWY4w2kM9lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aEGxiQVO1QtMNhXWKXReAwsHvhFPRL62tdmRDSrjVCAlT6nH3RKWsouFtiEEaQgza
	 GcrI0KUbGa7MAnIHF+2cCwJHLQshZnC2S5UJKF+7XM1Eg3+PdGFbzTb7gsqZHJe/tg
	 fA6/Erexnn08mm11OLOiUONEavrrDAUhmnY/nmkGindccduDLJmG1nvmmGFer9adhN
	 J0mpSPD/8QLUDpCyuiBNKN+B+C6SGqJVdCBnrvEXnC7htpp7DCkyq8NpL2aqOJ4aI9
	 fj37tzUEX0VmpRymGD5z/4MDnylk6DhjHSxG2xViJjIbC1eDaZy2vZDVFV3BpgUqb0
	 E3zJLHP+T7usw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wcdln-00000001wSv-3m8n;
	Thu, 25 Jun 2026 08:41:03 +0200
Date: Thu, 25 Jun 2026 08:41:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Sam Sun <samsun1006219@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: misc: iowarrior: fix use-after-free in release
Message-ID: <ajzNfyi6rJa-0d6h@hovoldconsulting.com>
References: <20260619150340.65058-1-samsun1006219@gmail.com>
 <ajlZby4OXzCKECmJ@hovoldconsulting.com>
 <CAEkJfYPgM19T+JWEfNdSwn7P8Pff+MECWwrfK1ujMHPFO5DrWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEkJfYPgM19T+JWEfNdSwn7P8Pff+MECWwrfK1ujMHPFO5DrWA@mail.gmail.com>

On Tue, Jun 23, 2026 at 08:28:46PM +0800, Sam Sun wrote:
> On Mon, Jun 22, 2026 at 11:49 PM Johan Hovold <johan@kernel.org> wrote:

> > I only saw your report last week and missed that you had posted this fix
> > until today when I was about to submit a series fixing this driver and a
> > few others that got this wrong:
> >
> >         https://lore.kernel.org/all/20260622152612.116422-1-johan@kernel.org/
> >
> > With the commit message fixed and the write references dropped they are
> > mostly equivalent.
> >
> 
> Thanks for taking a look and for the detailed explanation!
> 
> I agree that the per-write URB references are unnecessary once the
> outstanding write URBs are killed unconditionally on disconnect. Your
> series is a better and smaller fix.
> 
> I'll drop my version in favour of your series.

Sounds good, and thanks again for tracking this down.

Johan
