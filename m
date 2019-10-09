Return-Path: <SRS0=ivde=YC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A403AC47404
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 07:58:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F1C0218AC
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 07:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfJIH6l (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Oct 2019 03:58:41 -0400
Received: from mga17.intel.com ([192.55.52.151]:62725 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbfJIH6l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Oct 2019 03:58:41 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 00:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; 
   d="scan'208";a="206825859"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 09 Oct 2019 00:58:39 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 09 Oct 2019 10:58:38 +0300
Date:   Wed, 9 Oct 2019 10:58:38 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/9] usb: typec: Copy everything from struct
 typec_capability during registration
Message-ID: <20191009075838.GD12909@kuha.fi.intel.com>
References: <20191008111350.68581-1-heikki.krogerus@linux.intel.com>
 <20191008111350.68581-2-heikki.krogerus@linux.intel.com>
 <20191008204428.GA16138@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008204428.GA16138@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 01:44:28PM -0700, Guenter Roeck wrote:
> > @@ -1579,9 +1581,10 @@ struct typec_port *typec_register_port(struct device *parent,
> >  	mutex_init(&port->port_type_lock);
> >  
> >  	port->id = id;
> > -	port->cap = cap;
> > +	port->orig_cap = cap;
> >  	port->port_type = cap->type;
> >  	port->prefer_role = cap->prefer_role;
> > +	port->cap = kmemdup(cap, sizeof(*cap), GFP_KERNEL);
> 
> I just realized ... unfortunately kmemdup() can return NULL.

Of course. I'll fix that.

thanks,

-- 
heikki
