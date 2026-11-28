Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850564;
	b=a9FPg/AOZBnKoVZc1FTQIoGQc0ltG2kqnP5aPgQBO/j/kRLOOWVJpJ7wXa45IU6aAl8J
	 GcgXQ4FBV8KX63GCvgPAqcBgd8cvaGwW9rSJ5ifq/n4D5Rw8x5DsDjPNEJNNibnM7JGCg
	 iQ7TuH0nTDVrGfH6EqnHgRPWyv+Nj/LkK8UBg+pPxbQcaA5cP/G0cIcIfkVLBlxh8T0f3
	 VC5FrjEAoUEVEVXNSzIb10ZnV8JfjrZKgII8xB368wlbvJ4XLi6CCDJU2DAhz+hsEpmQ/
	 R3jxN7RKB0EL4k8PW1vroxxHur8O7T87QiUB/SvHPF61ECtVopRCxMzem4F/VPo5I9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850564;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pb7dDf78KgrgrTz3PTvRq0vXzYb+fcmZvzo/s0W+HIA=;
	b=in1Lz+cWjg+5mMyn5QEyXoKbkiPFmAzfabVtXRYii3XcTcfGObT7Jmj/uSU9jJnUYihP
	 Zky4dycuQZBasy6VZBWwL0pCU269YAu7F7mWsqSDCYmgcrxqlNkbMFIPzuiW3w4yM8ZXG
	 DdD5ciPoLgc15wTTQJtkFfS0RvY09o7yo6GZOIrcmOckxFXHgbC3hJ/GfatIJT0wscMlt
	 tUYP8ma+sJmxF2+dN4HUEaf7HRt6jpxZhsp7Um7IVLcwPzj8cRHM65WKhL1czx/98ZUL6
	 X6mZk8N+/apJUbDX82VE+Rwy2YbXEAfF4goH1Ar8URC87i0jXtZan8AoWF9bQxJuxoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HOCQ4H57;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36219606A31C;
	Sat, 28 Nov 2026 07:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HOCQ4H57
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CBC51F00893;
	Sat, 28 Nov 2026 07:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795850563;
	bh=pb7dDf78KgrgrTz3PTvRq0vXzYb+fcmZvzo/s0W+HIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HOCQ4H576cf3zden3DQB9EztwvSCaf/RxJR7UgvSL8bCKHe+s2E/3+6IJXUqtIu/i
	 GyVPodny8wkYdyRZMcdnen3wvcgnGajKwlp7g8HGFdZpjrW5T//WDoVg4glaYTRG7R
	 a6MbymD9rYuuRieKLDrtLvsxdTFk/k3GjsyTv4yo=
Date: Sat, 28 Nov 2026 08:22:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Retry if notification enable
 timesout
Message-ID: <2026112856-throwing-strongbox-478e@gregkh>
References: <mpearson-lenovo@squebb.ca>
 <20261104205654.3518943-1-mpearson-lenovo@squebb.ca>
 <9f5f0a57-dde5-44c9-ade6-96d1b8648ebb@app.fastmail.com>
 <2026112733-bobtail-undoing-be7f@gregkh>
 <25933253-59d6-4e1f-86c2-a8ae60a4cf82@app.fastmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25933253-59d6-4e1f-86c2-a8ae60a4cf82@app.fastmail.com>

On Fri, Nov 27, 2026 at 09:33:11PM -0500, Mark Pearson wrote:
> Hi Greg,
> 
> On Fri, Nov 27, 2026, at 3:47 PM, Greg KH wrote:
> > On Fri, Nov 27, 2026 at 03:42:39PM -0500, Mark Pearson wrote:
> >> On Wed, Nov 4, 2026, at 3:56 PM, Mark Pearson wrote:
> >> > Found on Thinkpad E14 G8.
> >> > When UCSI notifications are enabled the FW does not ack the enablement
> >> > itself. Future commands will be acked correctly.
> >> >
> >> > If this happens try enablement again and confirm acks are working
> >> > correctly.
> >> >
> >> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >> > Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> >> > ---
> >> > Changes in v2:
> >> >  - No functional change. Rebased as requested
> >> >  = Added Heikki's review tag
> >> >
> >> >  drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
> >> >  1 file changed, 6 insertions(+)
> >> >
> >> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> >> > index 5aab8ab9f013..6633ad6658f2 100644
> >> > --- a/drivers/usb/typec/ucsi/ucsi.c
> >> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> >> > @@ -2095,6 +2095,12 @@ static int ucsi_init(struct ucsi *ucsi)
> >> >  	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
> >> >  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> >> >  	ret = ucsi_send_command(ucsi, command, NULL, 0);
> >> > +	/*
> >> > +	 * Some FW may not ack the notification enable the first time.
> >> > +	 * If this happens, repeat to confirm it is actually working
> >> > +	 */
> >> > +	if (ret == -ETIMEDOUT)
> >> > +		ret = ucsi_send_command(ucsi, command, NULL, 0);
> >> >  	if (ret < 0)
> >> >  		goto err_reset;
> >> > 
> >> > -- 
> >> > 2.43.0
> >> 
> >> Can I float this back to the top of the mailing list please. I don't believe any issues have been identified and the initial version was posted back in July. This does fix an issue seen on platforms that are being sold with Linux preloaded and Linux users are using - it's real.
> >> 
> >> I can see Dell and HP fixes being pulled in quickly - what am I doing wrong on my side?
> >
> > I have 1000+ pending USB patches to review/apply still.  Please be
> > patient for things that are just normal feature additions like this.
> >
> Ack - understood. I get it and my note was poorly phrased. My apologies.
> I just wanted to understand if I'm doing something wrong - there were other patches in ucsi_acpi that landed after mine and went straight through and I didn't know why.
> 
> Looking at them again (e.g  8c51ea6 and b0baaf6) - I believe it's because they're tagging stable. I didn't realise it was OK to use the stable tag for patches that addressed FW issues (i.e. not correcting something that was previously wrong in the kernel itself - I normally only use stable for regressions).
> 
> Should I repost my patch with stable tag used? I don't want to jump the queue or cause extra workload - but I am addressing a real problem for real users on real hardware.

If it is a real bug for real users and hardware, then yes, it needs a
Fixes: tag and cc: stable on it, and you are correct, that is why I
picked those "earlier" than this one.

thanks,

greg k-h
