Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A74C77B73
	for <linux-usb@archiver.kernel.org>; Fri, 26 May 2023 18:47:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237033AbjEZSrz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 May 2023 14:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjEZSrx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 May 2023 14:47:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8804512A;
        Fri, 26 May 2023 11:47:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6E276529B;
        Fri, 26 May 2023 18:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6156C433D2;
        Fri, 26 May 2023 18:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1685126871;
        bh=7Ewo/4ajEjRmWhmGZ+9SXZd6O1YFzw+2EkxYBafQfzk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uE5eljKm4ie/dTxjbK736Bbj/sIhHn3w1hvC9niAzRqP8vYica3wqxE4WCR5lvpeM
         ftsOZgX+zbupGutnYF+e2DLRimujNDdKAXRC3WoIeoNXtxKqim36q4elSDwV/7F2Ht
         E3bkBTOtHkjk5CJu1cRN0ncwY6g67s4Ae+ppk4YQ=
Date:   Fri, 26 May 2023 19:47:48 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Roy Luo <royluo@google.com>
Cc:     raychi@google.com, badhri@google.com,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Bastien Nocera <hadess@hadess.net>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Flavio Suligoi <f.suligoi@asem.it>,
        Douglas Anderson <dianders@chromium.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH v1] usb: core: add sysfs entry for usb device state
Message-ID: <2023052619-morbidly-expediter-ab80@gregkh>
References: <20230525173818.219633-1-royluo@google.com>
 <2023052600-survey-fondness-27ce@gregkh>
 <CA+zupgzTe7pVhByLPVr4tn-94kCMZbzNHxf_iVyTa3qi6bzvAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+zupgzTe7pVhByLPVr4tn-94kCMZbzNHxf_iVyTa3qi6bzvAQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 26, 2023 at 11:34:44AM -0700, Roy Luo wrote:
> > Also, what userspace code is now calling poll() on your new sysfs file?
> >
> 
> We are looking at adding the code to the generic userspace components
> if not hardware abstraction layer in the userspace.

I can not parse this at all, sorry.  Care to rephrase it and point to
some real source code?

thanks,

greg k-h
