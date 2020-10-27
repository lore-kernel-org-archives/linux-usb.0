Return-Path: <SRS0=zRYX=EC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F40C4363A
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 08:38:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3D3722202
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603787900;
	bh=5BPZM0FlOnbe2GbLrnm2QdGezyf8fau+ODpmxorLYag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nJcMFh4o7/mqqe7rMQ+aax0sK5HpcNERYiWKTsclVvW1mYK9NOV9IVEaogYiFi35F
	 /CTCBUadDQBWGKplGLn5bJS5FNGVWN4uDCAPFQxKa8j+k/tQkGE/TVn+k1BW1vUrld
	 yfJfKlS2fYVjvBOKC2S3o16x4DWE9YtbT2fTJ9k4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895019AbgJ0IiQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 27 Oct 2020 04:38:16 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:44615 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2895016AbgJ0IiO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 04:38:14 -0400
Received: by mail-lj1-f169.google.com with SMTP id a5so772417ljj.11;
        Tue, 27 Oct 2020 01:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CI+M02FKP/0fuxVvjWM2p8vdvFe6OXxoGA9OeBYXfls=;
        b=H6cAlwxpO31aH1MwxMKbpKWuTEEWm/x1GaEK5WjebgNUsl2NuFWsEenveYAaCAWRPj
         dMxKuY6WE5fOkEo9FoQxRnyA9+ycm6g+3lwKc9p7Fk1kpHp9RxAmR9VhJM8XEQQm4Lql
         wXkS46yPDK1aNPyIDQ/1Jl/xXH9LQaRiecSp8M6Qo+bh3CLZP0jFIOT/FiwK5vei8cez
         MnOm2J6cjyl7JAChQn8B5mUHI9Ng3qs58i5KamUx8jHIhu4taMtC9+Arv669Y4BYokQo
         UbeQfI7xjddIjh2oNO9neuNgfjzCSzgOT/i3QEVGfE61xbya++cJ/1W07tIruB0GPirY
         XesA==
X-Gm-Message-State: AOAM532x7MCI4mdSaMFYHZLygTc1L8kKZWwC/jex2r0W3FTlY+QSWE31
        Mtyf5QuIEvwaMRUqOEeaATY=
X-Google-Smtp-Source: ABdhPJz+Vb6IYKU5jyyeCAqww4MeAeD3hIetBRiYei8AbOeO3Ocj0bFHaS239d0frfiuFnSQRsQd+A==
X-Received: by 2002:a2e:7811:: with SMTP id t17mr654160ljc.308.1603787892930;
        Tue, 27 Oct 2020 01:38:12 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id q15sm96895lfr.239.2020.10.27.01.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 01:38:11 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kXKUc-0002AX-VK; Tue, 27 Oct 2020 09:38:11 +0100
Date:   Tue, 27 Oct 2020 09:38:10 +0100
From:   Johan Hovold <johan@kernel.org>
To:     trix@redhat.com
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: serial: iuu_phoenix remove unneeded break
Message-ID: <20201027083810.GE4085@localhost>
References: <20201026191450.1429945-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026191450.1429945-1-trix@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 26, 2020 at 12:14:50PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A break is not needed if it is preceded by a return.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
> v2: split from original larger patch

Applied, thanks.

Johan
