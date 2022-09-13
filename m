Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E4AECAAD8
	for <linux-usb@archiver.kernel.org>; Tue, 13 Sep 2022 15:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbiIMP6p (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 13 Sep 2022 11:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236352AbiIMP6B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 11:58:01 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5D191D35
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 07:56:58 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id q17so803532lji.11
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=PSryuLt8d2S5NOnFQYaRkPd+ewmY9YOJjJlVlykIIBw=;
        b=PL6KQK4WAvTjNL4+2racF+mN5DenWrVgvTfKHYOm+TdmcOdBXajJDYGu389LYMga76
         oUHxjWLeSy9pbqbs2NWCLbFwPpAHiVTXhrc7QPnxKyrDCjUyqL35opweViGReRMLNghi
         Bw+KX6HO1tj+6pGtABPL2WSs7vcJaJ5qWQbQU2xeGWHyAh7PIxvR+zlDuuZzT8W3+srE
         hdboMRmbejnhTl8Nl6xaQsK3sWD2coMQIkTLhV6pGOgxuzJOoJ1v7luzQZSpvE6cT8DT
         gXMklK1wStxJaSEE95t3niygm91XlGX6v5/n0WFrglI0LZZnC3voDzTUaFlGqjPIVS8e
         twBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=PSryuLt8d2S5NOnFQYaRkPd+ewmY9YOJjJlVlykIIBw=;
        b=NOn74P6zVxDX3BFy1Zqc6Ewelyb/dPx8kiwNnq14sdQhLQUgTx/iqk85o698aSC0Gr
         hlsEL6EEhDG2FCC2GVBFuFSvSSCgDPyt1lP4cFC5N1iJOwnWoHnduA25LyZEyHpFiVtq
         PoKypn7zK0exTXAiUNtjUpCQfZjlJwJ3WaVd0D6wwNj8rQo7dL0RWfLMLtwULol0rBti
         8CPNMIbSBwKfuGJCX+NGCkzl6voXcQaLEFCHr73sjkAWFZdE21impPIpDEmjJJJSvC+4
         lU+ikLsgtWY8VYJXckAnScEoVEFqloLpXXz7E+rJaCsb36vxTp6KzK+OU4N8cbyDiZVk
         SlGg==
X-Gm-Message-State: ACgBeo3vdjiAcaV/V0kJwTuSg8H1YWopYf3gG9xF5T2ZhGIKeFS093UG
        e62wFoIq9J9fgrj+21az4p2tMJUK8/Iz09RS
X-Google-Smtp-Source: AA6agR4xan9LcIemBd+CCIzPWBfolAoJH5FobI9T3VFcNGbSV5nwx/8YASJdkNc6pzosk4RDb4XfCw==
X-Received: by 2002:adf:e10c:0:b0:225:3168:c261 with SMTP id t12-20020adfe10c000000b002253168c261mr18279435wrz.159.1663079845811;
        Tue, 13 Sep 2022 07:37:25 -0700 (PDT)
Received: from localhost ([5.181.106.148])
        by smtp.gmail.com with ESMTPSA id e11-20020adffd0b000000b00228da845d4dsm10633337wrr.94.2022.09.13.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:37:24 -0700 (PDT)
Date:   Tue, 13 Sep 2022 15:37:23 +0100
From:   Jamie Iles <jamie@jamieiles.com>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        ulf.hansson@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, kishon@ti.com, vkoul@kernel.org,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        gregkh@linuxfoundation.org, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        zhangqing@rock-chips.com, jamie@jamieiles.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v1 01/11] dt-bindings: serial: rockchip: add
 rockchip,rk3128-uart
Message-ID: <YyCVo/kHpWTbGpvx@elm>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 10, 2022 at 12:01:28AM +0200, Johan Jonker wrote:
> Add rockchip,rk3128-uart compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Acked-by: Jamie Iles <jamie@jamieiles.com>
