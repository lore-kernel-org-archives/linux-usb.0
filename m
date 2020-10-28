Return-Path: <SRS0=6o++=ED=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C74FC5DF9D
	for <linux-usb@archiver.kernel.org>; Wed, 28 Oct 2020 22:33:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C125920725
	for <linux-usb@archiver.kernel.org>; Wed, 28 Oct 2020 22:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603924388;
	bh=oi2U7us0Hcp1WYV1n8AmO/ar4S9WEYcCsG7281Sylqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZPWfAHLIcIYcroxVwemhlKHbmHvQtaZkRUIACTInZRybxjcvhmlRAPjDf5trU5u9F
	 3uINLW+4O2YVTDIMJQHdXRyUqXfzlKs5Ilo1XrZm1y8JJPdUg8wktAWnc34/pkCyoP
	 yKi6IpnddOd0KJi+MyIGm22k3xXfxjTHTn9Zoli8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388132AbgJ1WdG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:33:06 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36301 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388137AbgJ1Wcq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Oct 2020 18:32:46 -0400
Received: by mail-ed1-f68.google.com with SMTP id l16so1178525eds.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2020 15:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AnD14m59RyCYZ+TEcZur1g3L2+9d5Dkc7pSDJYh9J2E=;
        b=GB6HCSSPJC5bfcPbJCnd2Bvbs1/FvoMTX7HcE+rIU+WzQRu83MSQry3C9DAPYGWGst
         B4nS4z0r858E/VbvenzZt7UWRHvxXl41Fxl7WMhqXUmuKAa7fid0C7gSK4ahmXsao2Qs
         n5WwRLA69a2JE1efeGXO2R6OLr4lH1wBR4hog3GotYEdfFCSARJ22HOHiP5Wq/ZjiNAr
         59Tz4Q3t4XoTb1G5lXc5avzjWHjhv57cC+NnU0VHFCXLwFs+Ikiv8Z7bs+R9xFtDBlGe
         YIdemVsfa1DWcY3Ws51rNn9Yfq0CYGtuFG+JrxUgD+wAM6KWUTenMDRsfjlfEcvBmQYC
         pvhQ==
X-Gm-Message-State: AOAM532AhZR9PijppbI6cy6rjeGrBcG2rkG9hODpKhXFr9nX8WdwQxfv
        qunwzrsKh4cxLaCZryEh7uAyeniCtTK1DA==
X-Google-Smtp-Source: ABdhPJwjsYaQufcPYRu0rHRTbqnzc5qGI/FRLmxl91qefKThJlIHykh3mS/aIXDVq+NSZdTc8JWZSw==
X-Received: by 2002:a19:2d15:: with SMTP id k21mr2345838lfj.276.1603869431773;
        Wed, 28 Oct 2020 00:17:11 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id c21sm427151lfm.308.2020.10.28.00.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 00:17:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kXfhm-0005m2-QG; Wed, 28 Oct 2020 08:17:10 +0100
Date:   Wed, 28 Oct 2020 08:17:10 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Mychaela Falconia <mychaela.falconia@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] a family of FTDI-based devices that need ftdi_sio
 quirks
Message-ID: <20201028071710.GI4085@localhost>
References: <20200916015621.EFCDA374023F@freecalypso.org>
 <20200929101330.GQ24441@localhost>
 <CA+uuBqY83q+UiRsYxBckXvbtYf4sRxqB_8eXXPgEKAOqTwD=vg@mail.gmail.com>
 <20201005105722.GN5141@localhost>
 <CA+uuBqZ6JhCq1ydU-9A+en3QO=9zX9LuEJ8+P0YvEzUE+9sYoA@mail.gmail.com>
 <CA+uuBqZSozH_513OyiDyuh1DcvPrCkBer=_wedLQEEFSbdDrkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+uuBqZSozH_513OyiDyuh1DcvPrCkBer=_wedLQEEFSbdDrkw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 27, 2020 at 12:18:13PM -0800, Mychaela Falconia wrote:

> In your October 5 argument you wrote:
> 
> > Let me give this some more thought.
> 
> It has been 3 weeks - do you have any more thoughts that address my
> not yet answered rebuttal arguments in defense of my patch?

No, sorry, I haven't read your last mail yet. But don't worry it's not
lost, and I've started processing patches again now that rc1 is out.

Johan
