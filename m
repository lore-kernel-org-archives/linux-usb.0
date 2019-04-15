Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02D5C10F12
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 18:38:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AFA920880
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 18:38:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cqmi9e7T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbfDOSiy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 14:38:54 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42816 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfDOSix (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 14:38:53 -0400
Received: by mail-pg1-f193.google.com with SMTP id p6so8991650pgh.9
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2019 11:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CvolKWjh2fnJADcZs5pKB42NQdILTGkjwXZzYlyGySY=;
        b=Cqmi9e7TO3KTcTdinYwTPr+bdJBpvZCXd5ejTZoM5G4Yd1LMDP3VNBzFR78AjnkqI+
         NPqJC5PHBXQX2sfiNYelPBNtOA5GPuHnjbz5nB4Fqf6d2BK4BVFBfl8LNKw+2JpCAjaD
         /P/Tqy4ozU2gtKD/q1crtnN99JkiLYsxjIcCvWfqSSd/mpiE2kwiFX17KpC6F3NOjuak
         sXvFbIrKhSrBfWLuaJT1s8ELf2eSDJUmfTZjAZWjX+qvsU2a8maEmb2Jqv4RbDPh8oyv
         324TPrQPE2JTy2dg1rDyvO8H7w/eZtK6nMmsiz4qsahlTBiiNF0ImcrWfrsPo9HDvU90
         x8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=CvolKWjh2fnJADcZs5pKB42NQdILTGkjwXZzYlyGySY=;
        b=sfRr7NC5BtooHQ9ZUfMNLeXV+XzO7PTZDwFyecg8CYokOVctJMPZCqJksc5rIbk1yd
         XZ1+XUfVMAyEr3l2b0X3uFDhQg0z0K8fVzIo/q2aQMNnxcWFRJD4JbtPeE4U9PDTRxPh
         AhNXPTDTxOGWnbjt900PrFNboJGXHDVwGuCt3aysYWYkWT+0NNaiX9Y21jB4uxmIM6Ll
         d7MkT4CT7274L85yfCdR+T5HW5avK5cL+ebjtuKX3JrCrE4QdZnStSfWujv+L2z1bZWM
         kaTMe6haDbvrKC290swAthePsGijJV6YdDfMUsBm/FB6Ys91BTDoAQBk0BJcuS68BbrJ
         FGWg==
X-Gm-Message-State: APjAAAWT/78IgA2kYiCiIqi5rIhGN4fyYKKD5kiBhbpDksot938ysGBF
        1Nwru9P1QnIE0PKVm5z3CsE=
X-Google-Smtp-Source: APXvYqzpC8Jv/E92tP+HW7XeNdsruSkhIZb1vBHzGF+Ktecin6uoBb9rlMic9tUAqmtIJ/yNzEElHw==
X-Received: by 2002:a62:f24e:: with SMTP id y14mr75572830pfl.209.1555353532480;
        Mon, 15 Apr 2019 11:38:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t12sm103848032pfl.59.2019.04.15.11.38.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 11:38:51 -0700 (PDT)
Date:   Mon, 15 Apr 2019 11:38:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Add start_srp_connection_detect
 callback
Message-ID: <20190415183851.GC22463@roeck-us.net>
References: <20190413203955.10788-1-hdegoede@redhat.com>
 <20190415155113.GB7292@roeck-us.net>
 <c66d328e-0cea-9962-1fb6-009f78bf946e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <c66d328e-0cea-9962-1fb6-009f78bf946e@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415183851.4zk68DGoedZXU3oxKIcm-V4J1oMO55DVsO6Z-Jw4kBY@z>

On Mon, Apr 15, 2019 at 07:53:58PM +0200, Hans de Goede wrote:
> Hi Guenter,
> 
> On 15-04-19 17:51, Guenter Roeck wrote:
> >On Sat, Apr 13, 2019 at 10:39:53PM +0200, Hans de Goede wrote:
> >>Some tcpc device-drivers need to explicitly be told to watch for connection
> >>events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devices
> >>being plugged into the Type-C port will not be noticed.
> >>
> >>For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to
> >>watch for connection events. But for single-role ports we've so far been
> >>falling back to just calling tcpm_set_cc(). For some tcpc-s such as the
> >>fusb302 this is not enough and no TCPM_CC_EVENT will be generated.
> >>
> >>This commit adds a new start_srp_connection_detect callback to tcpc_dev
> >>and when this is implemented calls this in place of start_drp_toggling
> >>for SRP devices.
> >>
> >
> >Do we indeed need an additional callback for this purpose, or would a single
> >"start_connection_detect" call to replace start_drp_toggling be sufficient ?
> >If necessary, we could add the port type as argument (if the low level driver
> >doesn't already know that).
> 
> A single "start_connection_detect" call to replace start_drp_toggling will be
> sufficient AFAICT.
> 
> If you prefer that option, I can rework the patch-set accordingly.
> 

Yes, I do. I find it quite pointless to have two callbacks if exactly one
is ever called.

Thanks,
Guenter

> Regards,
> 
> Hans
> 
> 
> 
> >>Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
> >>Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> >>Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>---
> >>  drivers/usb/typec/tcpm/tcpm.c | 8 ++++++++
> >>  include/linux/usb/tcpm.h      | 6 ++++++
> >>  2 files changed, 14 insertions(+)
> >>
> >>diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> >>index a2233d72ae7c..1af54af90b50 100644
> >>--- a/drivers/usb/typec/tcpm/tcpm.c
> >>+++ b/drivers/usb/typec/tcpm/tcpm.c
> >>@@ -2553,6 +2553,14 @@ static bool tcpm_start_drp_toggling(struct tcpm_port *port,
> >>  			return true;
> >>  	}
> >>+	if (port->tcpc->start_srp_connection_detect &&
> >>+	    port->port_type != TYPEC_PORT_DRP) {
> >>+		tcpm_log_force(port, "Start SRP connection detection");
> >>+		ret = port->tcpc->start_srp_connection_detect(port->tcpc, cc);
> >>+		if (!ret)
> >>+			return true;
> >>+	}
> >>+
> >>  	return false;
> >>  }
> >>diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> >>index 0c532ca3f079..bf2bbbf2e2b2 100644
> >>--- a/include/linux/usb/tcpm.h
> >>+++ b/include/linux/usb/tcpm.h
> >>@@ -125,6 +125,10 @@ struct tcpc_config {
> >>   *		Optional; if supported by hardware, called to start DRP
> >>   *		toggling. DRP toggling is stopped automatically if
> >>   *		a connection is established.
> >>+ * @start_srp_connection_detect:
> >>+ *		Optional; if supported by hardware, called to start connection
> >>+ *		detection for single role ports. Connection detection is stopped
> >>+ *		automatically if a connection is established.
> >>   * @try_role:	Optional; called to set a preferred role
> >>   * @pd_transmit:Called to transmit PD message
> >>   * @mux:	Pointer to multiplexer data
> >>@@ -149,6 +153,8 @@ struct tcpc_dev {
> >>  			 enum typec_role role, enum typec_data_role data);
> >>  	int (*start_drp_toggling)(struct tcpc_dev *dev,
> >>  				  enum typec_cc_status cc);
> >>+	int (*start_srp_connection_detect)(struct tcpc_dev *dev,
> >>+					   enum typec_cc_status cc);
> >>  	int (*try_role)(struct tcpc_dev *dev, int role);
> >>  	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type type,
> >>  			   const struct pd_message *msg);
> >>-- 
> >>2.21.0
> >>
