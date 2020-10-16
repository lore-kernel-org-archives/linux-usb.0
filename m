Return-Path: <SRS0=Vm3N=DX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD97C4363A
	for <linux-usb@archiver.kernel.org>; Fri, 16 Oct 2020 17:08:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7D3820874
	for <linux-usb@archiver.kernel.org>; Fri, 16 Oct 2020 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602868139;
	bh=HxqErmzMhxLOoRDXPs3XAW1P+h6Q0AaPLJqP+9pGa/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=eZdClhihuJcxia4ikuJRmWHlBvreNHrAS8jipLUyaQ/Vkx40ggoOEMf7L4gD5wcwJ
	 5OTDCCemIrHO9Qz0ktxycYLrMwXJvatEhwVttO2rQ2bHLwuunhOmZstnAMJ0Or4dwZ
	 zcx4PmU5e/4mMQE96vBYhIRDgBDo1cVd58nxUUyo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410986AbgJPRI4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 16 Oct 2020 13:08:56 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38826 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410172AbgJPRIz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Oct 2020 13:08:55 -0400
Received: by mail-ot1-f68.google.com with SMTP id i12so3046410ota.5;
        Fri, 16 Oct 2020 10:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U1oGCHxCpJm+5c6m1olk8Wivcld4RJW5REIrPGu1ncw=;
        b=ovUNDD46iOwVZcqPtGvuj29IlyaAkLkE7vKdKjS4oCVmqyDmmrwkUf7SDpmyXlKjL3
         IqrgYV2o0IZ00ovjPB53M8jw9gPUTxb8O07HpJ8zuHnNer6jImZHEsEbKBljBvjGBTHq
         h5c6EDe6jhxLtCMwHOGG4Q9u1lAXPWxqGF6je+SE1TXNS3BH5dJLUhVhHeGxVJY24Y66
         iJhpfB2dOklyj5DBlqBqF9a5l3dYcHK/IBQZ8mHUPUC5oPxcg1zK3P0d8P2pZbKwPQ3R
         02omzJyFgsE3ousxscy5X0mNrowDEtRmzRi720c71DV5laoC/S2I/AYrCM+Ar9XHd7eZ
         8jmg==
X-Gm-Message-State: AOAM532R3FumTNRPbzBaXoWZd3y88DLomTY4n08PFhg8otwr6FjBJ9Z5
        Q+EmY7RQmFaJlbFMgLlH2Q==
X-Google-Smtp-Source: ABdhPJx+aLbatJsSq+L6yfjjn87rPcGWBxhbJwGu/0E60QxhHUbgdcwHkFB0INfNENHq19He3zgWsA==
X-Received: by 2002:a9d:2c4:: with SMTP id 62mr3455382otl.224.1602868134734;
        Fri, 16 Oct 2020 10:08:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f124sm1214248oia.27.2020.10.16.10.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 10:08:54 -0700 (PDT)
Received: (nullmailer pid 1585783 invoked by uid 1000);
        Fri, 16 Oct 2020 17:08:53 -0000
Date:   Fri, 16 Oct 2020 12:08:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-usb@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        linux-mediatek@lists.infradead.org,
        Stanley Chu <stanley.chu@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Min Guo <min.guo@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: usb: convert mediatek, musb.txt to
 YAML schema
Message-ID: <20201016170853.GA1585729@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-5-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-5-chunfeng.yun@mediatek.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 13 Oct 2020 16:52:04 +0800, Chunfeng Yun wrote:
> Convert mediatek,musb.txt to YAML schema mediatek,musb.yaml
> 
> Cc: Min Guo <min.guo@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: new patch
> ---
>  .../devicetree/bindings/usb/mediatek,musb.txt |  57 ---------
>  .../bindings/usb/mediatek,musb.yaml           | 113 ++++++++++++++++++
>  2 files changed, 113 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
