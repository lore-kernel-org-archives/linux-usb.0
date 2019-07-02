Return-Path: <SRS0=rQJG=U7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264A2C06510
	for <linux-usb@archiver.kernel.org>; Tue,  2 Jul 2019 12:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E451D208C4
	for <linux-usb@archiver.kernel.org>; Tue,  2 Jul 2019 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562072204;
	bh=zujQgf+rqhHlciDFO+waUgdcZOKkgT6w1APAAI0wHWQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=Dctn4iYzjGMhvW/2xIyHLnS6C3ttm3PoWoomNVqVWSRvw9PX6CSYFWVXRliOLlN0X
	 lg45JiOrG4L49X1s+D9pfCBtAIQDkVOO91xDiSccTM4+JPQ5RqvjA3DOYKqWDL7CzP
	 1JvhNwvkuxkML7AEBrWLaTr5S1N5OCXrt8rHW1XY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfGBM4n (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 2 Jul 2019 08:56:43 -0400
Received: from mga11.intel.com ([192.55.52.93]:7159 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbfGBM4n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 08:56:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Jul 2019 05:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,443,1557212400"; 
   d="scan'208";a="157635400"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga008.jf.intel.com with ESMTP; 02 Jul 2019 05:56:40 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Greg KH <greg@kroah.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Aspeed vhub configuration
In-Reply-To: <e90076897577e2b4d2ad864eff85406b19f88dd3.camel@kernel.crashing.org>
References: <44bb150fb8b283a3036a382fa7e821b045554c15.camel@kernel.crashing.org> <20190702122430.GC12019@kroah.com> <e90076897577e2b4d2ad864eff85406b19f88dd3.camel@kernel.crashing.org>
Date:   Tue, 02 Jul 2019 15:56:40 +0300
Message-ID: <8736jobnnb.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:

> On Tue, 2019-07-02 at 14:24 +0200, Greg KH wrote:
>> 
>> > That leaves me with two approaches, that aren't mutually exclusive, but
>> > I'd like to run them past the folks here before I start coding:
>> > 
>> >  - The defaults, currently hard coded, could be replaced with Kconfig
>> > options.
>> > 
>> >  - The device-tree node could contain optional override of those
>> > defaults, allowing a vendor to customize the hub for a given board.
>> > It's not per-se a HW description, but the device-tree is also fairly
>> > commonly used for HW configuration, even if some people disagree with
>> > me on that one (hint: they are wrong :-)
>> > 
>> >  - I could add sysfs properties underneath the vhub device instance to
>> > customize it. This would also allow userspace to control whether the
>> > hub is "connected" to the host or not, which could be useful, some
>> > systems don't want it to always be there. Today there's no choice.
>> > 
>> > Any other option ? If somebody says netlink I will scream :)
>> 
>> DT seems like the logical choice, I'll not object to that.
>
> DT for defaults sounds good yes. I'm still toying with also having
> sysfs properties. There have been people wanting to connect or
> disconnect the hub from the host programatically, a property in the
> device node would be best for that. Being able to override the serial
> number as well. The DT isn't a great place for that.

We already have an interface for disconnecting from the host
programatically by disconnecting data pullup.

static ssize_t soft_connect_store(struct device *dev,
		struct device_attribute *attr, const char *buf, size_t n)
{
	struct usb_udc		*udc = container_of(dev, struct usb_udc, dev);

	if (!udc->driver) {
		dev_err(dev, "soft-connect without a gadget driver\n");
		return -EOPNOTSUPP;
	}

	if (sysfs_streq(buf, "connect")) {
		usb_gadget_udc_start(udc);
		usb_gadget_connect(udc->gadget);
	} else if (sysfs_streq(buf, "disconnect")) {
		usb_gadget_disconnect(udc->gadget);
		usb_gadget_udc_stop(udc);
	} else {
		dev_err(dev, "unsupported command '%s'\n", buf);
		return -EINVAL;
	}

	return n;
}
static DEVICE_ATTR_WO(soft_connect);

part of udc/core.c

-- 
balbi
