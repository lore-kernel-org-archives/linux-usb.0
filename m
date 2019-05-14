Return-Path: <SRS0=fHaM=TO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0820C04AB7
	for <linux-usb@archiver.kernel.org>; Tue, 14 May 2019 19:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 679BE2166E
	for <linux-usb@archiver.kernel.org>; Tue, 14 May 2019 19:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557862220;
	bh=L6ZOthuj/KPFW+LivAPaYvQA1z948fec8Br54T0T5Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=TVGeJaePaD6LTkWYQXVq0sUbTp/kzMObxf8yQoyuvy5woRTWjlX+Z3QPc90/ApLih
	 Mt5dF9bGg1+EvXAy/k/nmjrDMRULoLLOMW2xVsgpNiJ7t7rWI3EqCjV84ewRBud70b
	 xvSVPrWDYPcVcyOagai6aZXa6bMLAb98iQslqwDc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfENTaT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 14 May 2019 15:30:19 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36230 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfENTaT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 May 2019 15:30:19 -0400
Received: by mail-ot1-f65.google.com with SMTP id c3so16361790otr.3;
        Tue, 14 May 2019 12:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HIMR+DIH6rdR6Yw4tErlWybT9HlSjqfGRbrJTH3k/h4=;
        b=opSVGUh1B9RSpMBIcejkW4Rv47rIBS1RCUQcd91T4yAIbtndH0sp6+OhIXpLaU/pM0
         6kx+ZmnEQEmQZjnvRwGyWQa7sbH4Aj/WPDRhe0Uias7XVaZUYBxiUMJ/m+2rRrZA/TXx
         y2yn/AuYpD1Bqyw8ThqHenxtpCXpemiHgBHEKihhZyWP0mhqCQ9DLQ0ziZsG6EoOxqCo
         PnnzHZXfuS+0sAeHLh8b/zSr8KjYXtMuOhG488DE+Xh1S7DFRPehuRKIqyZiV3r0yxwW
         2/RTAgKhrbfY2AFdzUFci0CFjqfDw950lj6VKIJTJznO/thGz8U+biyC/G0kfwcsEAeO
         rGsA==
X-Gm-Message-State: APjAAAXKW0ODYhhfCMt+BOBCPm6cBWgoUfICprHKyA3jvQLdG28N+8vn
        /A4SFQjbR+rxMl6Cy4kAMA==
X-Google-Smtp-Source: APXvYqzibAk/BZZeWuxQo95q5VLAhTtdp4PBSpp7c4gjshxKhd5T0HuqjAKwUjgZTZ8lKg0i+LtrTw==
X-Received: by 2002:a9d:6116:: with SMTP id i22mr21988439otj.13.1557862218171;
        Tue, 14 May 2019 12:30:18 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k65sm6608306oia.16.2019.05.14.12.30.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 12:30:17 -0700 (PDT)
Date:   Tue, 14 May 2019 14:30:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [PATCH v3 12/15] dt-bindings: usb: renesas_usbhs: Add support
 for r7s9210
Message-ID: <20190514193017.GA18012@bogus>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-13-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514145605.19112-13-chris.brandt@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 14 May 2019 09:56:02 -0500, Chris Brandt wrote:
> Add support for r7s9210 (RZ/A2M) SoC
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
