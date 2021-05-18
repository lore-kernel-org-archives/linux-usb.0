Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA47C433ED
	for <linux-usb@archiver.kernel.org>; Tue, 18 May 2021 13:31:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 165A561285
	for <linux-usb@archiver.kernel.org>; Tue, 18 May 2021 13:31:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245451AbhERNcs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 May 2021 09:32:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:41450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238635AbhERNcs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 09:32:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94B75610A1;
        Tue, 18 May 2021 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621344690;
        bh=AQcXbOCQe8U95i8kgKYGNsDmCjZ26eRzhWl2krTizEo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r24mnIC/fCRj3RU/MduMgLjB0Yy1ABWNeBIb/VrlLClFsaLRsnICuExoYNB9/mabC
         rt6gM1h4Ipx6ozOM6DRNvFwyntmU2iOe4NU7eQk862vNnE+frpsTOl+vowMnjDCqt8
         lU4aKmeYmXQNF4u5Gb9lquLxCW0NgnoDgJTYIwhY=
Date:   Tue, 18 May 2021 15:31:28 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v1 2/2] usb: typec: tcpm: Add module parameter to wrap
 around logs
Message-ID: <YKPBsKM70ZLfjx8+@kroah.com>
References: <20210517233609.610248-1-badhri@google.com>
 <20210517233609.610248-2-badhri@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517233609.610248-2-badhri@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 17, 2021 at 04:36:09PM -0700, Badhri Jagan Sridharan wrote:
> When the buffer is full, TCPM stops logging into the buffer.
> This change adds log_wraparound module parameter which when set
> flushes out the oldest log entries (FIFO) to make way for the
> newer ones.
> 
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index b79194919b27..a369decade60 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -38,6 +38,10 @@ static bool modparam_log_misc_dev;
>  module_param_named(log_misc_dev, modparam_log_misc_dev, bool, 0444);
>  MODULE_PARM_DESC(log_misc_dev, "Expose tcpm logs through misc device");
>  
> +static bool modparam_log_wraparound;
> +module_param_named(log_wraparound, modparam_log_wraparound, bool, 0444);
> +MODULE_PARM_DESC(log_wraparound, "Wrap around logs");

Again, no, this we know better than to add new module parameters, this
is not ok.

greg k-h
