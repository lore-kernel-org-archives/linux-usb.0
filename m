Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6793F6C5E;
	Fri, 10 Jul 2026 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688224; cv=none; b=r7Q+BBy+JSlGGgIAnlRjEddsrVJR6F0VDhJqvm1cUQqlcgZpbMlUVymiVpLEztFvNyOOSnPItF1/He+QUjJYz7fREzElR0tyCGYk3ykQwqFWcMwOriAbeU78GrQbG1aDsRhi5rceZjif82YHNbNjRmH9PQgOFVt3QtOY/nPJr7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688224; c=relaxed/simple;
	bh=r4kSGkPIw3/HevKs31Rjk+sY0qLPIvkS2In9fGGwPiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci3lZPJO27czssPJBbBj3YThEgzkPjJclqyRC3/g6sLy14MqdMHJmSXsSiBTE7VW8ghmHPFjhOCA48lVwsD/oGjXkDtZwHvMulFHmhn8M8YPG/h2gdoxWe4jDihXSghBWboyjpc5aFx10ShOyP7rDsoylATEXMVqsXXpwl0PNRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AR2B2ndb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AR2B2ndb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AB71F000E9;
	Fri, 10 Jul 2026 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783688223;
	bh=MNjj4m0+qGWIfnYbpTKG6uBYlcbZZZYCtdKfNrKiGwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AR2B2ndbvHaiXWyG6hGzJHHOOZ+Q82dkVZ1SXcwBKWCc02zbbBVUTIBJuV5ZUvFrq
	 6epd+zCbmNOZvbjKFxVKGNMwu1E3LQhpXo4zbZyrW6BmHXAy1BekRlnW6TAYpHK89d
	 F5NK3mb4dw5NOgLTjCwy0/9m4df/A2rXcLjFJcVU=
Date: Fri, 10 Jul 2026 14:56:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ming Qing <a0yami@mailbox.org>
Cc: Peter Korsgaard <peter@korsgaard.com>, linux-usb@vger.kernel.org,
	julian@jusst.de, Pavel Hofman <pavel.hofman@ivitera.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: f_uac2: fix memory leak in
 UAC2_RATE_ATTRIBUTE store
Message-ID: <2026071044-goggles-preview-5a9c@gregkh>
References: <20260609091957.2716984-1-peter@korsgaard.com>
 <87zf0xmpfv.fsf@dell.be.48ers.dk>
 <6564238.328878.1781520721949@app.mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6564238.328878.1781520721949@app.mailbox.org>

On Mon, Jun 15, 2026 at 06:52:01PM +0800, Ming Qing wrote:
> On Sun, Jun 14, 2026 at 5:39 PM +0800, Peter Korsgaard wrote:
> > FYI, I see the same issue is also fixed in the recently proposed
> > "[PATCH] usb: gadget: uac: validate rate list length before storing"
> > 
> > https://lore.kernel.org/linux-usb/20260519143319.147494-1-a0yami@mailbox.org/
> 
> Yes, that includes the same buffer lifetime fix. I'm happy to split it up if that makes it easier to pick.
> 

Please do, I just took that one now and this series does not apply.

thanks,

greg k-h
