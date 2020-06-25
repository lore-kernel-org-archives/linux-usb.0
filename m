Return-Path: <SRS0=oapS=AG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82706C433E0
	for <linux-usb@archiver.kernel.org>; Thu, 25 Jun 2020 16:13:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D6C92089D
	for <linux-usb@archiver.kernel.org>; Thu, 25 Jun 2020 16:13:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aeam.us header.i=@aeam.us header.b="fEjGn9Ri";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TRjOcemY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403781AbgFYQNc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Jun 2020 12:13:32 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45135 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389860AbgFYQNc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 12:13:32 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 3942A5C0109;
        Thu, 25 Jun 2020 12:13:31 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Thu, 25 Jun 2020 12:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm2; bh=Je/tL5ZHRLRlXWai6e6+JdcMb1hIOHU
        EeRpd7Ljef9w=; b=fEjGn9Ri369orJGRUc3h22732KMhfkXfG/axRYCh/Q+eXKL
        +qeGUT2K2elxGhROcWaP9EWviF6mZfC9dVuCU7EvBnndrr/bzQr4ElBo9mdgEbNf
        5tX4xwiMCkkJIRxdy0jR1CF9NxcVvZzFMELjGmf04+lAI7MI9i6YtFiff8L096vb
        jHKVm6BqZzzrYFeFaFzjDEQ4L+zOOE5PA6FbeDmg0xXr3yyzFvN/dEpI15ej4Qga
        l57emAm8hxDZFE6pzkKdMmmUUQ0UYw/bY/TY3/fy2WRaK5Osc28hsKFTtUP2fiZ8
        LceULczkddiNaP9brUgAAhCbMLa0q7Y75hbluVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Je/tL5
        ZHRLRlXWai6e6+JdcMb1hIOHUEeRpd7Ljef9w=; b=TRjOcemYIc9+l4ynxxjpvy
        b7TYF5XwJ16SClIp0mpnT+1XigpfNK9BOVuc2yFSg+ceeHipq6N7cvgsVbyatq/Q
        PeOYwiZfoyH0FhGksyUNMhBDX1Xg+r+rmQ/gfNkPJcVCkQtHh3RLCBjaKHf49fH7
        BfDTzj8J0akx/bEH2xoHr3JPUdoKIhTJ/1scqo0C69GPx8PqxLnHqcakLqBX6Z32
        CQdG6I4/Z1RLZZseVXT1nj8yQuJxc/VcYKcGm1mH+oXTM/4/ya6j46hs2uf3XEb/
        XYA5jTRMzOIpkrIl0VjlIY7ui5zxZWQrv6dxSwYaS3GCSYc7UDjoc/JlX345LdZg
        ==
X-ME-Sender: <xms:Ks30XhYvCFNoo-z5m0C_hg1fCKVg-m4kPN_clqMUzoqaUnJuTGkiqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekledguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhi
    ugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpeevge
    fhveevteetfeetkeejjeehudffffffhfeuffelhfeuffdufeduleejfeeugfenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmh
    druhhs
X-ME-Proxy: <xmx:Ks30XobsB3nY_BdhRV1Ia_YnhGqnoolKNRI4eLW-hkEtq-Pm0XPfXA>
    <xmx:Ks30Xj9xyN2BJD9GDOwHuEWF-HvdwwfMlSEzTBkN95mEnbb2Yn11Kg>
    <xmx:Ks30Xvo9DtEQZ_HWovJ4TZixcjSx21CMyNtaFQmPNHONGgHWrFg3ww>
    <xmx:K830Xp0my80EUfYcAdWDV0FTYChui8btgGqewbF83fRTD-xoXqMefg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B34B4660085; Thu, 25 Jun 2020 12:13:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-543-gda70334-fm-20200618.004-gda703345
Mime-Version: 1.0
Message-Id: <37b88453-7346-400f-94d9-36e8854c9f10@www.fastmail.com>
In-Reply-To: <CAP6JJ88avATE3w7HMn94wTti8GY7uncXKT=zLLRbVTz9xbXKVg@mail.gmail.com>
References: <CAP6JJ88avATE3w7HMn94wTti8GY7uncXKT=zLLRbVTz9xbXKVg@mail.gmail.com>
Date:   Thu, 25 Jun 2020 11:13:00 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Mark Deneen" <mdeneen@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: crash when cleaning up gadget configfs directory on sama5d2
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 25, 2020, at 9:18 AM, Mark Deneen wrote:
> Am I doing something incorrectly? What can I do to debug this further?
> 

On my device it's impossible to remove anything from the configuration once
added. Are you sure it is expected that the gadget can be reconfigured after
UDC binding and then unbinding? (This is a general question to the list as
well, I'd like an answer to your original post also.)

My workaround is creating a new gadget and binding the UDC to that instead.
Or just rebooting.
