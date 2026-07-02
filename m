Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F272625A359;
	Thu,  2 Jul 2026 05:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782971394; cv=none; b=dkHrHeiizueRhvjYDhI6L1Z4aqsUQN6mzNaEXU1TrHmIQTQnGFAide8vEmd13CFfDB/Uzk0Ycsvp5bmPlLVYbDfenoePL/flkLUwTwiVUft8sx8KVmXZvTDVzZnl5tMXP9HwczGgPUiHsmUl2qxiaMhIKoiEM6f/kbiPOpvUUgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782971394; c=relaxed/simple;
	bh=EDRUuh+6zXkDC6bSO+pBJ53xZRIngJO7/7EDLI3npoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qD6kOfEdMJZtUcyhuT2uxET/1Qb5WZL+EYlap0M+bRAr0V+hi76OxOSrCxq2DvK/8caK3K4zJH2YeNGWd3vKHVqFq5HHkO9NH+XUuQgN8iAdKPlQU4AvuAz4BaubyBNP4KQrxQIJxZ1iIf8rhCRZrcRDhth1kfdXX1l72IMenRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qxOXo+km; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qxOXo+km"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E3C1F000E9;
	Thu,  2 Jul 2026 05:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782971391;
	bh=drONu/zGq5+g6bv2cU4LDpfbDiQn6v9A3/zW6m6HwB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qxOXo+kmK1OVnezmS7rtaUvG47J+JQthmu+aN+B5Pu6M+TgeC4tsxCUAxxUEqt1Kz
	 kclJV29CPXVXxG9ncm+BY5trqi19+rl5vcCsaArGK0qdJSPAqjHgJDBFxtHXBGdhhK
	 WK0V/2vnsj7p41NMX8BEvvD326CieOfQJlASyj9k=
Date: Thu, 2 Jul 2026 07:50:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, Sean Rhodes <sean@starlabs.systems>,
	Kees Cook <kees@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: port: Deattach Type-C connector on component
 unbind
Message-ID: <2026070208-catapult-customize-7da3@gregkh>
References: <20260611071201.1235545-1-acelan.kao@canonical.com>
 <CAMz9Wg_X5D=T4evVOi+pns_x=gD43RA8ZURvk9eyYVBF+OE33Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMz9Wg_X5D=T4evVOi+pns_x=gD43RA8ZURvk9eyYVBF+OE33Q@mail.gmail.com>

On Thu, Jul 02, 2026 at 10:26:39AM +0800, AceLan Kao wrote:
> Chia-Lin Kao (AceLan) <acelan.kao@canonical.com> 於 2026年6月11日週四 下午3:12寫道：
> >
> > connector_unbind() is the mirror of connector_bind(), but it is missing
> > the symmetric call to typec_deattach() that connector_bind() makes via:
> >
> >     if (port_dev->child)
> >         typec_attach(port_dev->connector, &port_dev->child->dev);
> >
> > When a Thunderbolt dock is unplugged, two teardown paths race:
> >
> > 1. The component framework calls connector_unbind() first, which sets
> >    port_dev->connector = NULL without calling typec_deattach().  This
> >    leaves port->usb2_dev/port->usb3_dev in struct typec_port pointing at
> >    the USB device that is about to be freed.
> >
> > 2. usb_disconnect() then calls typec_deattach(port_dev->connector, ...),
> >    but port_dev->connector is already NULL, so the call is a no-op and
> >    port->usb2_dev is never cleared.
> >
> > 3. Concurrently, UCSI detects a PD partner-disconnect event and calls
> >    typec_unregister_partner(), which reads port->usb2_dev (now a dangling
> >    pointer to freed memory) and passes it to typec_partner_unlink_device()
> >    -> sysfs_remove_link() -> dev_name() on the freed device, corrupting
> >    the typec/UCSI partner state.
> >
> > This corruption leaves the Thunderbolt tunnel in an inconsistent state on
> > the next dock hot-plug.  On affected hardware the dock's I225/igc NIC fails
> > to enumerate: AER fires a slot reset while the igc driver is still
> > initialising ("PCIe link lost"), and the subsequent igc_reset attempt hits
> > igc_rd32 on an already-detached device:
> >
> >     igc 0000:2e:00.0 eth0: PCIe link lost, device now detached
> >     igc: Failed to read reg 0x0!
> >     WARNING: CPU: 9 PID: 129 at drivers/net/ethernet/intel/igc/igc_main.c:7005
> >              igc_rd32+0xa4/0xc0 [igc]
> >     Call Trace:
> >      igc_disable_pcie_master+0x16/0xa0 [igc]
> >      igc_reset_hw_base+0x14/0x170 [igc]
> >      igc_reset+0x63/0x110 [igc]
> >      igc_io_slot_reset+0x9e/0xd0 [igc]
> >      report_slot_reset+0x5d/0xc0
> >      pcie_do_recovery+0x209/0x400
> >      aer_isr_one_error_type+0x235/0x430
> >      aer_isr+0x4e/0x80
> >      irq_thread+0xf4/0x1f0
> >
> > 4. UCSI later handles the PD partner-disconnect and calls
> >    typec_unregister_partner(), which still sees the stale port->usb2_dev
> >    and tries to remove its sysfs link a second time:
> >
> >    kernfs: can not remove 'typec', no directory
> >    WARNING: CPU: 6 PID: 55 at fs/kernfs/dir.c:1706 kernfs_remove_by_name_ns+0xe9/0xf0
> >    Workqueue: events ucsi_handle_connector_change [typec_ucsi]
> >    Call Trace:
> >     sysfs_remove_link+0x19/0x50
> >     typec_unregister_partner+0x6e/0x120 [typec]
> >     ucsi_unregister_partner+0x107/0x150 [typec_ucsi]
> >     ucsi_handle_connector_change+0x3ec/0x490 [typec_ucsi]
> >     process_one_work+0x18e/0x3e0
> >     worker_thread+0x2e3/0x420
> >     kthread+0x10a/0x230
> >     ret_from_fork+0x121/0x140
> >     ret_from_fork_asm+0x1a/0x30
> >
> >    With worse timing the same stale pointer is dereferenced after the
> >    backing memory is freed, turning the warning into a use-after-free.
> >
> > Fix the asymmetry: call typec_deattach() before clearing
> > port_dev->connector, matching what connector_bind() does on the bind side.
> > typec_partner_deattach() is already protected by port->partner_link_lock,
> > so it serialises safely with the concurrent typec_unregister_partner() path.
> >
> > Fixes: 11110783f5ea ("usb: Inform the USB Type-C class about enumerated devices")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> >  drivers/usb/core/port.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index b1364f0c384ce..b4452b665f591 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -740,6 +740,8 @@ static void connector_unbind(struct device *dev, struct device *connector, void
> >
> >         sysfs_remove_link(&connector->kobj, dev_name(dev));
> >         sysfs_remove_link(&dev->kobj, "connector");
> > +       if (port_dev->child)
> > +               typec_deattach(port_dev->connector, &port_dev->child->dev);
> >         port_dev->connector = NULL;
> >  }
> >
> > --
> > 2.53.0
> >
> 
> Hi,
> 
> Just a gentle ping, please help to review this path.

It was the merge window :(

Also, if you wish to have patches merged quicker, please provide review
comments on other patches while you wait, what is preventing that from
happening here?

thanks,

greg k-h
