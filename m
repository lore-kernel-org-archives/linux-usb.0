Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE337C19F2D
	for <linux-usb@archiver.kernel.org>; Thu,  4 Aug 2022 17:08:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237125AbiHDRII (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 4 Aug 2022 13:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbiHDRIH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 13:08:07 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FEE35E327
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 10:08:06 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id d7so394245pgc.13
        for <linux-usb@vger.kernel.org>; Thu, 04 Aug 2022 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xcHD0rmCevHtOXoxMV/kPS+CYB/uJh1PVeFT9PFxhEQ=;
        b=I0rs2vQnXM/6+tMl051HmEPfv/hMCAtded5s8SZFMZkKXgfn9gKAyPs2A1FrvXVC3X
         znNPMh5PBIL4zU0Pr88K0hsgC1xJnMsJtvnVW8fL9+DvY3kngVFbnsnCHUtZtYGfCrAW
         oMIVFyBqQ+BtlBUSvgj7en6Ytcc+qH3abY9tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xcHD0rmCevHtOXoxMV/kPS+CYB/uJh1PVeFT9PFxhEQ=;
        b=ekQpfWIkxwVX+4YclYWfSAgtaFlsYSpUttqim2DpW/NU/yZhuqHKbGycsdodcTVDgK
         olc3u8NXhcN9jboWLfF2wmqamLLg5STwKrHClIuPiR5m8edFvb0ui8siu0McqRFCWz/B
         yc+K2vOxWz8SJhtd6UJAjzehe5qW1dEn+1ctUj06Ne55Cz50A3MpPPJxRAiRJLwy0Ck6
         BRvVqDpt8Ie7aBeII2jt3N0KLK1DZCG/mt4OQSaL9rUM7z5Kv02U11ou3GDbDofG439b
         X+2/gSufWPYMKxWnmQHDJMKLC/20RgkCq1AAv1NqNvxZwf7Gq+WIkHpyja9BTBXJnhvQ
         c+zQ==
X-Gm-Message-State: ACgBeo3FnL2WCJR0FvllNvE047H/lTV4YGWluq5GCzqEHC3llVEhNyGb
        iWfCwSA/pUJyin12HnftFt+Nsw==
X-Google-Smtp-Source: AA6agR6fRbxYkMQznPNUtay7X2wFyuKgdxVo76mv0Vz/1wO7fvq4Mfxc6Tslh/uNJMAy75DXFnarpg==
X-Received: by 2002:a62:5441:0:b0:52b:ab93:1f05 with SMTP id i62-20020a625441000000b0052bab931f05mr2659803pfb.30.1659632885576;
        Thu, 04 Aug 2022 10:08:05 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:87c4:32ca:84b6:e942])
        by smtp.gmail.com with UTF8SMTPSA id t6-20020a170902b20600b0016d7b2352desm1143873plr.244.2022.08.04.10.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 10:08:05 -0700 (PDT)
Date:   Thu, 4 Aug 2022 10:08:03 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 9/9] usb: dwc3: qcom: clean up suspend callbacks
Message-ID: <Yuv8890X5ePuRR36@google.com>
References: <20220804151001.23612-1-johan+linaro@kernel.org>
 <20220804151001.23612-10-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220804151001.23612-10-johan+linaro@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 04, 2022 at 05:10:01PM +0200, Johan Hovold wrote:
> Clean up the suspend callbacks by separating the error and success paths
> to improve readability.
> 
> Also drop a related redundant initialisation.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
