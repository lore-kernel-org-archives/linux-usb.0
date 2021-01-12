Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A725BC43381
	for <linux-usb@archiver.kernel.org>; Tue, 12 Jan 2021 19:41:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B46623117
	for <linux-usb@archiver.kernel.org>; Tue, 12 Jan 2021 19:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393065AbhALTlD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 12 Jan 2021 14:41:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:49524 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726110AbhALTlD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 14:41:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 145CAAB7A;
        Tue, 12 Jan 2021 19:40:22 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     linux@roeck-us.net
Cc:     a.seppala@gmail.com, boris@konbu.org, dianders@chromium.org,
        gregkh@linuxfoundation.org, hminas@synopsys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [RFT PATCH 0/4] usb: dwc2: Fixes and improvements
Date:   Tue, 12 Jan 2021 20:40:16 +0100
Message-Id: <20210112194016.5049-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20200226210414.28133-1-linux@roeck-us.net>
References: <20200226210414.28133-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Regards,
Nicolas
