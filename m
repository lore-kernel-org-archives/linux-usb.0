Return-Path: <SRS0=SlCS=BG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F97C433E1
	for <linux-usb@archiver.kernel.org>; Mon, 27 Jul 2020 11:27:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF04B20663
	for <linux-usb@archiver.kernel.org>; Mon, 27 Jul 2020 11:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBic21Pp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgG0L1W (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 27 Jul 2020 07:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgG0L1T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 07:27:19 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75761C061794
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 04:27:17 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id c2so6002030edx.8
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 04:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=uSIEERrJr/M5ipYOxwqtrQGcYEDPp1/Y938zPNAgt8I=;
        b=CBic21PpbdBxoOlG42r/CaeQuYUOuMpYc5iD6K/Al9a5OUh8soRSUeafcKodfyEDxw
         Tj293WAdV43UqbpSHoEntWL8jtdEvUDEdGoc8UWBBdgxycBsDKZavUJ5FWjYc6WseMtj
         FMZX6x60Plpfok9KEv/3GEz3D7hdvhDj4dZkKMmcCMKGfx1Z6KthIvaR1ZekXnJXhpX3
         ZGvpVEKAP9Tlc03HROo0zq+k64GvV9T2vP6Yy4BdVr3I09L6cfCeTl6NjJzEwawzL+hV
         wHOfOiHUR22kjpo0bH6DtpTwgoeafe/M/D1YexM3M4BAbU+ythROIC0eVftaZOVA+GiD
         gsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=uSIEERrJr/M5ipYOxwqtrQGcYEDPp1/Y938zPNAgt8I=;
        b=WDC+a/8iquhXf/YJlXMxc8Pz8tutPI5PLLg3eGcbScWhpVhEqIFWApuqf4t0iiNNPw
         cBjbusfQ/Z0O5ShsgZiGI+h5GFFffNPvV7vJS76nW5503U0MpAqcw7ZGqWlirnIzvmvJ
         VxArkPVju2PgtsgEUHTRt6kNclgu86issCnNr7jx2Vx8yGlaOf5Y0D44P3+ZtVR15+07
         IlBGRuix+w7aafQ6Rss95Ialp61DOrCBUPMPLm8e9AWhgZVZS2Q9usdlcJv4pJjLs33f
         zc4Wz9UyIeudAiPAPECmUv+uwnYb8WZUfUHWDmpbzjxaJwAYEEYz0eNGS+NFMvWhF/Qx
         qJfQ==
X-Gm-Message-State: AOAM531m4YxBgRJbto3Hk7yPTzeWynC/GT8hLqvAoJIa7QMe3ws05/dR
        Y5cmyYP/0IJxUHWYp0Jju4w=
X-Google-Smtp-Source: ABdhPJxanpiZHXKl3H4Ezg8NQ+65YDyyJVwuDR+UfyP4N7ssZo/yo3EyrTVLOv+ryVOnRpz+FOqfHw==
X-Received: by 2002:aa7:dd10:: with SMTP id i16mr21281737edv.227.1595849236252;
        Mon, 27 Jul 2020 04:27:16 -0700 (PDT)
Received: from [109.186.98.97] (109-186-98-97.bb.netvision.net.il. [109.186.98.97])
        by smtp.gmail.com with ESMTPSA id du2sm1217012ejc.2.2020.07.27.04.27.15
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jul 2020 04:27:15 -0700 (PDT)
Message-ID: <5F1EBA04.5050109@gmail.com>
Date:   Mon, 27 Jul 2020 14:27:00 +0300
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Oliver Neukum <oneukum@suse.de>
CC:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        hdegoede@redhat.com, stern@rowland.harvard.edu
Subject: Re: [PATCH] usb: core: Solve race condition in usb_kill_anchored_urbs
References: <20200727072225.25195-1-eli.billauer@gmail.com> <1595844840.13408.17.camel@suse.de>
In-Reply-To: <1595844840.13408.17.camel@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello, Oliver.

On 27/07/20 13:14, Oliver Neukum wrote:
> That however is really a kludge we cannot have in usbcore.
> I am afraid as is the patch should_not_  be applied.
>    
Could you please explain further why the suggested patch is unsuitable?

Thanks,
    Eli
