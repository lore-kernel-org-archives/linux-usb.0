Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D36C76196
	for <linux-usb@archiver.kernel.org>; Fri,  7 Apr 2023 09:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240492AbjDGJGA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 7 Apr 2023 05:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232606AbjDGJF5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Apr 2023 05:05:57 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656046A40;
        Fri,  7 Apr 2023 02:05:54 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id CCA7666031CF;
        Fri,  7 Apr 2023 10:05:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680858353;
        bh=laCsmRgchMhCg4Gn7heh1gDxcLUQM5vkkYCEL4cE2rY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ABIEL/tKYEU2m+l4zbFSd1n9OYNlKBMdE0FOGDMbxRL8xlNqqDpCNIuAFcFNbZGWH
         E0VWwR3JX5Z4L3oCQGLyIR0jO66vQmvnR3km0sagMukXaP1Bd4Vz5IHSvhlHi5L9iV
         hR2k7gviX75gtxbVUNbyYkUA6MZVU1aJ8AEKzFk6NjBtYGiG6O3UXnured/F5VIwoJ
         qAfvBvsMXgqaWhgrgC22SA96/a8TzaM8s40+pJMfaXElOb/l4Eom9w3mZ+WQRJknCz
         +yzyooP97k30It4qotA3VhGtJf6gj9RapGXE97ZD/MdYVaGgpsBTxqlf7TGP3HS6pY
         27Ak9I7lkmZYg==
Message-ID: <15befa07-7f17-23b0-9141-a7ae8ee70c71@collabora.com>
Date:   Fri, 7 Apr 2023 11:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mtk-xhci: add an optional frame
 count clock
Content-Language: en-US
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tianping Fang <tianping.fang@mediatek.com>
References: <20230407062406.12575-1-chunfeng.yun@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230407062406.12575-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il 07/04/23 08:24, Chunfeng Yun ha scritto:
> Add optional clock 'frmcnt_ck' used on 4nm or advanced process SoC
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

