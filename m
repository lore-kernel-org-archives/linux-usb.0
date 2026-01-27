Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5850227BA4
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769499572; cv=none; b=KFNxI/YmVWT7BbBB+9hkrSLUd8aBEnEfrBrRRhUl2f5XamrjgZRN1aFQlu0fo7ix0EmraHZdm/DX63FXDv4hGpwaVqqoCXFXA58uy3ROmXnDNCvu6w76WOp9QpZ8OQaHEnEkAZTc3bXpSoHKsoWH38PP09uoQPh0HElQxoyP+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769499572; c=relaxed/simple;
	bh=cqJ7BSDvPQA5yVjvE1voj6PsWMqvGSw0bGrRuReyTWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1Iq0qwFbc+upzw5aZQI9xskxmTOGFok8xhItIxufmWt2FTR/cgN6hF4V2oGbX/BybUkfq1sbauq5H95+xXPgZWiU4CYP5tW1/OHyfIdsgwJk+U/qFPB3yPXjsmH3JX4Rk2UGuItYE53LjwFKUlng13ugj9EZMa1lZG0tcr8kGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wihK21Uz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wihK21Uz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38DDC116C6;
	Tue, 27 Jan 2026 07:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769499572;
	bh=cqJ7BSDvPQA5yVjvE1voj6PsWMqvGSw0bGrRuReyTWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wihK21UzCmkpGXS+Yg9/8CCc20W/0IR3zbgyTgzwsWwXHaWjJXr4JL+V5fBpYjqU6
	 6N+gkHx1V5nT2BOpY9+FDH/245IaIVLOlcJPfHpq6QEZCF4G0+UxBxGw3L8HwErwHQ
	 2a+WrPRK3IFNzW8347ddsKesUwjvwrrCV2LOCcZg=
Date: Tue, 27 Jan 2026 08:39:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: kenny@panix.com, linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com, michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com, zhanjun@uniontech.com
Subject: Re: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and
 route transfers per slot
Message-ID: <2026012754-ferocity-operator-e3b2@gregkh>
References: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>
 <FF69E7CC57E8D606+20260127023900.2145949-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FF69E7CC57E8D606+20260127023900.2145949-1-raoxu@uniontech.com>

On Tue, Jan 27, 2026 at 10:39:00AM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Some xHCI hosts expose multiple MSI/MSI-X vectors and support multiple
> interrupters with independent event rings, but Linux commonly routes all
> transfer completions through interrupter 0.
> 
> This is not about increasing USB link throughput, but about avoiding a
> driver-imposed single hot spot.

What do you mean exactly by "hot spot"?  Usually this is a good thing,
driver code is in the cache, as are the data structures, so this keeps
data flowing well with less latencies.  Why would you not want this?

> On hosts that already provide multiple
> MSI/MSI-X vectors and independent event rings, routing all completions
> through interrupter 0 creates unnecessary contention (serialized event
> handling/locks and coupled moderation), increasing CPU cost and tail
> latency under many active devices/endpoints.

So this is a MSI routing issue, not a cpu cache issue?

And exactly what type of contention is happening here?  How can it be
measured and noticed?  The latencies involved in USB are huge due to the
protocol and hardware, why would a CPU even notice such things?

> Using secondary interrupters
> simply matches the hardware's design, similar in spirit to merged
> xHCI-sideband work: exploit available parallel paths rather than
> funneling all events through one.

What do you mean by "secondary interrupters"?  The sideband work was for
a totally different issue, whereby the normal hardware and CPU was
bypassed to allow it to remain powered down and to save battery life.
Spreading interrupts across CPU cores does the exact opposite of that,
ensuring that cores can NOT go to sleep when the work should be only
done by one of them.

In short, please post numbers showing how this really is noticable
somehow.

thanks,

greg k-h
