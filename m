Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25610481ABE;
	Wed, 17 Jun 2026 15:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710037; cv=none; b=EGFURuld4Vhdyw9a/rEwKrQYdy6ECL8haR19zvPP41LrJbjzTABTw3cUtrgQLibypokxwDj9X7zv/ygVJPTyKLamyFXoEkwI9UmOP2RQbkKNBRDGlA0aOhAfAECmeae8f6Bf2h75Z/TW/0AuJzsmtwcBd+2PTutjgY9P/Tk9UnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710037; c=relaxed/simple;
	bh=lmk0czLG2NC33Ll4gpZruA7Mm1lGraInA9baeSmbxE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdAT0Hlx6giBtzLPNYPy4IXZ3JnDB0ZVbYerwHY6iETUX/eWe1FYLUdHlg4hkd45lvjcS0DUMk2MNc7VYHEiPpEDnWsJDisBYmIYj26m7n2wgApaduBPaWVAQ7/94NPJM5uneJQ4TKdQPOKvBVccKbkXMKULj45+Awrk0tasgS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w5Sm/5pk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w5Sm/5pk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4EF1F00A3A;
	Wed, 17 Jun 2026 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781710032;
	bh=ky321GWK5F1ndjCqbG1gNkxh3vHiEqxMrSs00qldEQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=w5Sm/5pke0uu6UHI28s0UWiTZlhYWCQQRcstIg4xWZFlajPhwL8ooISZT46kslMfo
	 pHViMNfdNKlXsOKB5IM/XqBGSqRu7RHikLqbjTSIbc2kgmXH5CopXMioutkjLKwP4N
	 6rIfrfg8S04ej+D11+O2ee4L55G33fjsB1fM/Tjw=
Date: Wed, 17 Jun 2026 20:56:03 +0530
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Waiman Long <longman@redhat.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Kuen-Han Tsai <khtsai@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vratislav Bendel <vbendel@redhat.com>
Subject: Re: [PATCH] usb: hub: Make usb_hub_wq type depend on
 isolcpus/nohz_full setting
Message-ID: <2026061747-anthology-punk-e8ff@gregkh>
References: <20260521170659.984284-1-longman@redhat.com>
 <57bc3250-e81b-4c72-ae17-a12e94ce250a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57bc3250-e81b-4c72-ae17-a12e94ce250a@redhat.com>

On Wed, Jun 17, 2026 at 11:18:05AM -0400, Waiman Long wrote:
> On 5/21/26 1:06 PM, Waiman Long wrote:
> > A Red Hat customer reports a kernel stability problem where hung tasks
> > are reported with occasional kernel panics. Analysis of the core dump
> > indicates that USB work items are running on isolcpus+nohz_full cores
> > competing with RT-class tasks running on those core while holding
> > usb_hub device mutex transitively blocking other kworkers waiting for
> > the same mutex leading to hung_task reports.
> > 
> > As the usb_hub_wq uses the WQ_PERCPU flag, it will run the work items on
> > the same CPU that queues them. For many use cases, it is a more efficient
> > setup leading to higher throughput as it reduces cacheline bouncing.
> > 
> > It is a different story if the system needs to run latency sensitive RT
> > workload on dedicated isolated CPUs. Having the kworkers processing work
> > items on the same set of isolated CPUs will likely break the low latency
> > requirements of the RT tasks. As the RT tasks have higher priority,
> > not much CPU time will be left running the kworkers to process work
> > items which, in turn, will block other tasks that have dependency on
> > the completion of those work items. In this case, using a WQ_UNBOUND
> > workqueue to avoid running on isolated CPUs will be more beneficial.
> > 
> > One solution to get the best of both worlds is to make the workqueue
> > type depending on whether the "isolcpus" or "nohz_full" boot command
> > line options have been specified. If at least one of those options are
> > present, usb_hub_wq will be created as an unbound workqueue. Otherwise,
> > it will remain as a percpu workqueue.
> > 
> > Signed-off-by: Waiman Long <longman@redhat.com>
> > ---
> >   drivers/usb/core/hub.c | 14 +++++++++++++-
> >   1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 24960ba9caa9..f79e5edd627a 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -33,6 +33,7 @@
> >   #include <linux/random.h>
> >   #include <linux/pm_qos.h>
> >   #include <linux/kobject.h>
> > +#include <linux/sched/isolation.h>
> >   #include <linux/bitfield.h>
> >   #include <linux/uaccess.h>
> > @@ -6066,6 +6067,8 @@ static struct usb_driver hub_driver = {
> >   int usb_hub_init(void)
> >   {
> > +	unsigned int wq_flags;
> > +
> >   	if (usb_register(&hub_driver) < 0) {
> >   		printk(KERN_ERR "%s: can't register hub driver\n",
> >   			usbcore_name);
> > @@ -6077,8 +6080,17 @@ int usb_hub_init(void)
> >   	 * USB-PERSIST port handover. Otherwise it might see that a full-speed
> >   	 * device was gone before the EHCI controller had handed its port
> >   	 * over to the companion full-speed controller.
> > +	 *
> > +	 * Create WQ_UNBOUND workqueue instead of WQ_PERCPU if either isolcpus
> > +	 * or nohz_full boot option is specified.
> >   	 */
> > -	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | WQ_PERCPU, 0);
> > +	if (housekeeping_enabled(HK_TYPE_DOMAIN) ||
> > +	    housekeeping_enabled(HK_TYPE_KERNEL_NOISE))
> > +		wq_flags = WQ_UNBOUND;
> > +	else
> > +		wq_flags = WQ_PERCPU;
> > +
> > +	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | wq_flags, 0);
> >   	if (hub_wq)
> >   		return 0;
> 
> Ping! Any further comment on this patch?

Sorry, it's the merge window right now, will look after -rc1 is out.

greg k-h
