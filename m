Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800E01F5437;
	Wed,  8 Jul 2026 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509753; cv=none; b=ALzFP3pK3Y/eaBZuvf7o+9JehLJ1eGZn8TcXgEXgDA7V7fT+XDDaZtXXZTP1JPxa7Y6E1qC9BE5z5XRio593L1Vq/089pLpsHHzMGNH+IYRZGrcX1hQJ/xxMb95/sMuo34GXC3h3GY4EYc9GvzPT4wnSPCLB3IpybWBsjI3BMt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509753; c=relaxed/simple;
	bh=fPEoMjHju1TACxG0Wx1DaEi86+Fi94zQlzdmd3yvoiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8Egq2LN3xdrLNKjNcAfkfs0xfPHaKEUoVSG+XfyiC2WwouhLpaCFg//kW3VESCnqReCAXDn/X6j5I5PQW/vAVdH5gH/mvZ6QfkOyDEX705+gNVng7o/1Q1pVD7rOCY7Lt+taEJ5TWR0jzrIA5myomGhsDr+nFI92zLPo0grf7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CIuBdqUP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CIuBdqUP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5D51F000E9;
	Wed,  8 Jul 2026 11:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783509752;
	bh=rUw3G+ObIrTtPZEW3zDhBhpq8KaVLKZPOszLvC5w9as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CIuBdqUPQ4MYXZ9TxlaEKtcdVvbH7ir4/GybDvF6JrdSNFBmzxv1qj5l2nhtUtHDK
	 fquBpP+TbUJpDOESUh+vmBU3shGCOHddM5swZm7csdmVKVlyQ1AdDyP13E/r4dOI5b
	 KkeIUfc329C1zM6rWvYxtq1X+B7FYMLpnWLV8Npk=
Date: Wed, 8 Jul 2026 13:21:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Waiman Long <longman@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Kuen-Han Tsai <khtsai@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vratislav Bendel <vbendel@redhat.com>
Subject: Re: [PATCH] usb: hub: Make usb_hub_wq type depend on
 isolcpus/nohz_full setting
Message-ID: <2026070833-siesta-catnip-7100@gregkh>
References: <20260521170659.984284-1-longman@redhat.com>
 <ahb97cx_4dqPayDW@localhost.localdomain>
 <6789ae0a-3c87-4d62-970f-2662e0050062@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6789ae0a-3c87-4d62-970f-2662e0050062@redhat.com>

On Fri, Jun 05, 2026 at 02:05:19PM -0400, Waiman Long wrote:
> On 5/27/26 10:21 AM, Frederic Weisbecker wrote:
> > Le Thu, May 21, 2026 at 01:06:59PM -0400, Waiman Long a écrit :
> > > A Red Hat customer reports a kernel stability problem where hung tasks
> > > are reported with occasional kernel panics. Analysis of the core dump
> > > indicates that USB work items are running on isolcpus+nohz_full cores
> > > competing with RT-class tasks running on those core while holding
> > > usb_hub device mutex transitively blocking other kworkers waiting for
> > > the same mutex leading to hung_task reports.
> > > 
> > > As the usb_hub_wq uses the WQ_PERCPU flag, it will run the work items on
> > > the same CPU that queues them. For many use cases, it is a more efficient
> > > setup leading to higher throughput as it reduces cacheline bouncing.
> > > 
> > > It is a different story if the system needs to run latency sensitive RT
> > > workload on dedicated isolated CPUs. Having the kworkers processing work
> > > items on the same set of isolated CPUs will likely break the low latency
> > > requirements of the RT tasks. As the RT tasks have higher priority,
> > > not much CPU time will be left running the kworkers to process work
> > > items which, in turn, will block other tasks that have dependency on
> > > the completion of those work items. In this case, using a WQ_UNBOUND
> > > workqueue to avoid running on isolated CPUs will be more beneficial.
> > > 
> > > One solution to get the best of both worlds is to make the workqueue
> > > type depending on whether the "isolcpus" or "nohz_full" boot command
> > > line options have been specified. If at least one of those options are
> > > present, usb_hub_wq will be created as an unbound workqueue. Otherwise,
> > > it will remain as a percpu workqueue.
> > > 
> > > Signed-off-by: Waiman Long <longman@redhat.com>
> > > ---
> > >   drivers/usb/core/hub.c | 14 +++++++++++++-
> > >   1 file changed, 13 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > > index 24960ba9caa9..f79e5edd627a 100644
> > > --- a/drivers/usb/core/hub.c
> > > +++ b/drivers/usb/core/hub.c
> > > @@ -33,6 +33,7 @@
> > >   #include <linux/random.h>
> > >   #include <linux/pm_qos.h>
> > >   #include <linux/kobject.h>
> > > +#include <linux/sched/isolation.h>
> > >   #include <linux/bitfield.h>
> > >   #include <linux/uaccess.h>
> > > @@ -6066,6 +6067,8 @@ static struct usb_driver hub_driver = {
> > >   int usb_hub_init(void)
> > >   {
> > > +	unsigned int wq_flags;
> > > +
> > >   	if (usb_register(&hub_driver) < 0) {
> > >   		printk(KERN_ERR "%s: can't register hub driver\n",
> > >   			usbcore_name);
> > > @@ -6077,8 +6080,17 @@ int usb_hub_init(void)
> > >   	 * USB-PERSIST port handover. Otherwise it might see that a full-speed
> > >   	 * device was gone before the EHCI controller had handed its port
> > >   	 * over to the companion full-speed controller.
> > > +	 *
> > > +	 * Create WQ_UNBOUND workqueue instead of WQ_PERCPU if either isolcpus
> > > +	 * or nohz_full boot option is specified.
> > >   	 */
> > > -	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | WQ_PERCPU, 0);
> > > +	if (housekeeping_enabled(HK_TYPE_DOMAIN) ||
> > > +	    housekeeping_enabled(HK_TYPE_KERNEL_NOISE))
> > HK_TYPE_DOMAIN is supposed to be a subset of HK_TYPE_KERNEL_NOISE anyway so
> > the first should be enough.
> Yes, that is the ideal case. However, that is not currently what some users
> are doing as they haven't changed their setup yet.

What does this mean?  If this is a subset, just check that one please.

> > > +		wq_flags = WQ_UNBOUND;
> > > +	else
> > > +		wq_flags = WQ_PERCPU;
> > > +
> > > +	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | wq_flags, 0);
> > But then what happens if no isolcpus= is passed but later cpuset creates
> > an isolated partition?

You didn't answer this question :(

thanks,

greg k-h
