Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8615F12CD8B;
	Mon, 15 Jun 2026 02:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490575; cv=none; b=MAP2glSxyqrzS2u/pe287dgX+0f0FBDbcwAgLSotaJimvEanyv+OVvT02K7Dg/hQdsXu6AY2kptyLepcu4uJmAVRqAV/apVsdnDBd/xo6B6Vy/rn3OHlU/yZgP3LjhZI/27OFpxqpCwqUtsbSfuy2F36HqEgjpe7/EnxJuO5WkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490575; c=relaxed/simple;
	bh=ovfGSvaAnvitqIpJOZ1LkF4qGXzzJ7uneRo1b9B9soA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e077E4kxBTDKqDDpFngwUnuJLLp4/8Za2CTEo+u8dlXQtSqQYIXn3+r/ypKNMoXvwHPJspWa2SIyIT/4fuaWuGJHv2MH9kYFPToXp+MQaH+1k/565vETgbDRfCYdx8QhhyqKJjg+tpLVETbfa4H2EpxAQZ1x+tTPtBuHXq/EGic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dXZ4xvql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dXZ4xvql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801D71F000E9;
	Mon, 15 Jun 2026 02:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781490574;
	bh=GOeMq8EyaCrbakDnUs7ZlaFP+Oe+WxNyYb4IwGzLMIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dXZ4xvqlzr4M7vXVjwYMcv10nDey4knwJjKoHiExpFE7AwqPBrRZ19RCKVb9X88ev
	 UDjTfvZn92PlIoKYIkg+GMuHGrd8A0geBYLPGH4HhI6DkrYqn5paMinqGU3VcT3Pes
	 jqbpSdyebfm/JMuqxp3LkLiPvbvr1EaC92GVX+qk=
Date: Mon, 15 Jun 2026 04:28:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Leonid Konontsov <lkonontsov@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: serial: replacing mutex_lock to guard(mutex)
Message-ID: <2026061555-climate-phosphate-4747@gregkh>
References: <20260614192337.9449-1-lkonontsov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614192337.9449-1-lkonontsov@gmail.com>

On Sun, Jun 14, 2026 at 10:23:37PM +0300, Leonid Konontsov wrote:
> Moving from manual mutex_lock's and mutex_unlock's to guard(mutex) in
> ark3116.c file.

That says what you are doing, but not why.

Please don't change code to use guard() unless you are fixing a bug.
Otherwise the churn in the kernel would not be worth it.  Just use it in
new code please.

thanks,

greg k-h
