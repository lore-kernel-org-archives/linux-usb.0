Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8A02C21FD
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 01:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917934; cv=none; b=AFEbCm02C727Tau/yQMgCiheV6b9kHsQyUa6HXJO7wkw00HAAWBrIeV4v1fVrEyMqrgbZiHAjp45IM0sWC8MCD8Q8sATArDSc/Ligmz/HCBITSt7YzkqYbpK5EITe3QVSXRE3KXnBijWHm70nWe+EPc5tcJcxFQzXZlCpa4IcFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917934; c=relaxed/simple;
	bh=gUemplhRSJAJzKCTLJsrmo/7lPnTZM3iiNRs9Xdx/h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZm1lcnu/X8Vt/xI2ACr/joBV7ZjRDhW5nS9y6QuKxbfivFkDK4aEYJhXT8ZG8xWWEOvaMNmnC4BZVA2lqgbPe7MWSQ6CPACRHGY9IdVV2RLxX/dsmgNV+Q9Mvt/vLaaqWrR7d+8TBsa1txc/uyGKXGBAdzE6drgQIaxQvFX5Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4RInRbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPEgJjqW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4RInRbx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPEgJjqW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MfucQ3653859
	for <linux-usb@vger.kernel.org>; Wed, 9 Sep 2026 01:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12hVyvMp5VWwWi9UH2JEM1r68VsvC3lqeQsWrxP240E=; b=b4RInRbx1BBew7/g
	B6orKYvjqSpnL16u5jIetYkLxy5mHBzlIguNwVuC9yO+aB90XM6XR9OVq6za9XEV
	3wcpCh5HsIMYqz7kFxboCyz1Yu/xa8kgPxZuY/Xs1BLw8mPyWyWYDQhV/qU5w66k
	4B0p3cv+nY/m3mojS3n7hs3NRRF9NVKuCCR2SuxvZv54EgUaDz3SgqOt9P3yGqRu
	hSpVpXgroSlqhIgxRXlRAEp/XIpg/6ew171QpwtrktF39WrhOC86dHNSQs6q2koi
	gky/BS8CGYXb8bV6LXetk1iSBjBrbFf5kKA1vfKc0zhvFIrDYmamkgUjc4dsyuTD
	PA5B5Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp1tqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 01:38:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6642029a12.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 18:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788917931; x=1789522731; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=12hVyvMp5VWwWi9UH2JEM1r68VsvC3lqeQsWrxP240E=;
        b=WPEgJjqWPi1dPXkJZqGWfb+F6+Q681TcLQez+zid1915bs+3BQNbewFh0iaUGwwEg/
         qvpMBtkbO86FY7sBeSsoCWYY7LhwtPTiU1Y17OXdC9KffGf0CRsKoZDjv0bHjELXPCst
         IsuMWTzrEueSX/DvZQgnOIPhOIku+VAoJIwNQq4AJUvsitdbBA0v05O8/S9hY46au8Fy
         2ckjgZdKRlfkGqZyTHRzIJmMqHNRg7bRyfGwiq62pE+RAGiLt5Rq8Ndu7+Jtx2meNq/p
         eIvoNAHSc1xEHFq3mvFDET32WRtfmiVnCLrtsaiP+PGSfrzSNz0zwD/vTyzaoAxb0/Th
         fD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788917931; x=1789522731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=12hVyvMp5VWwWi9UH2JEM1r68VsvC3lqeQsWrxP240E=;
        b=rjqmFLRa3t9LJqFvhOS8dRiZSWBl/vH2HNHdJPwSSg46mXtePao5CAJCUXhqraWipr
         +5Vw26wOV8LdMDthN+uN8ToN66hxIU03ldLzJf21bUiILdP3DZKKWnhB50sx+4JSww/c
         pLdW8/L307FFzeggPt1bA+IioHXwReESCBAKXTvgdI3Opn8ARnUG3vcfAQxZPvwLBgi/
         HS/vtQBdB4sUWBNLAQ6uJrv5IR9eiD6CgPT1DRW4eY9K/G2Sh7vaH54r44Q3/zUnFC6A
         NMByx/xHTkEIQ8hqXqE+0e3vrL8I00r+S/UxpGKXLsFdPV5t0b5YLcXM+rkiP7NxJsE5
         /TQA==
X-Forwarded-Encrypted: i=1; AKwUvByXW9yCcElkhRMEskL0KKxR/wvOyD2kQ9LWGGWCauovF/ScQf2W3xcIdi12wbXbWjKFXeaWRs7zUCU=@vger.kernel.org
X-Gm-Message-State: AFuF++kz7r1MRembjCmOvE86CaILhRihy99plYG9fbvTj8BhgzcPhRjH
	TFjrtz53mz8VaMchmWhHiwSpt+vk5T3IPVoqKisjWP+Q0idvmDKxPcXvvrZfWmtmJ0GY8UhM7EA
	9CQS1DQKw9JJg5Qu17YDE1BDNRQ6uoWR/u/7i+dxKTCad0xKmHbw+D9ZB0MxKQKY=
X-Gm-Gg: AYBFou04pFZ3bsBvq9nBtl1/M710UMPfZ/azn/dTLFZloK27e7rPiTyuKAAYFqq4GvT
	fI9+QuUTwgxROwLr69LdKxlTDSl7/sjfiVkSdx6P9uw/UOF4TPTwq8/d8KY8/tQkZCCNS3DQg3J
	9A/8tJNoC7crCXlPmMdnFegLcLI8e895fRzTOwE+0qoNx8SVJrJnGuFrFXm5Vepm/V72mZCJZgq
	arvuSy7pNOZeRAGZJmUhWw1vazIH2U0tD8mTZgSMtF7en/0unRc6J3BK6Ps9Y34QIvqjswWnJdW
	LD9ta5UAOcZaZXB0YKjVGTrZAT+tchnA+RPkF3N3ysl193GbxKjeLvrjHR+U2xMRlsdiVZVKOcI
	MZJB5oIghuqS3R5jWbCioCwggRdKfWAeorhfOPxZg36k=
X-Received: by 2002:a17:90b:1b44:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39b2613249fmr43588072a91.8.1788917931269;
        Tue, 08 Sep 2026 18:38:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1b44:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39b2613249fmr43588010a91.8.1788917930810;
        Tue, 08 Sep 2026 18:38:50 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm35410573c88.0.2026.09.08.18.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:38:50 -0700 (PDT)
Date: Wed, 9 Sep 2026 09:38:43 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: Add onsemi FUSB15201 driver
Message-ID: <aqC4oyV4WUdGynv-@QCOM-aGQu4IUr3Y>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
 <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>
 <ap51p16bSY1Ru9C1@monoceros>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ap51p16bSY1Ru9C1@monoceros>
X-Proofpoint-GUID: 5ZXAwEDcZSD-3QgP99mcvvB0zuB4h6i2
X-Proofpoint-ORIG-GUID: 5ZXAwEDcZSD-3QgP99mcvvB0zuB4h6i2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDAxNiBTYWx0ZWRfXwBrgunZvsQhk
 aKG0qeyJFKej6SmAyb157sZrdsNsbXcj+SfsfKZYYATsLc2+Cf9y0jeFnZbpGZVheQAKU4amIiU
 88YpDazk9gxyfvnMMz4aPOqXpat5OoB0RdrT3l4OuGZZcBZl8BkwsHvHw3IsD9Db7Xi3imfKVWA
 VF9G0NrQf2VY4ua1lKQBBx1s9G8ntpM9kotjYP4ksyv4yGNHVTPcycDlnJcr7QNBczdI/hEVP+5
 84dNQ+NCwHqnA/s9f8lw+qmq0D+6yQw7dEWwYlY/1+py0BD0LxgZfv7gv6D5D8A8kC7r3g2Kegi
 AynVaQPqd+jkj3a23M0UD3jUNMzhL5i0kEA9bHRmxB6DsDhyEIbW0or5tyeBMXzuTs7OUApEFMI
 fttyKBr+z1eAfXRZ/u2YWgqEUjLVEL8Arpm+OyRpwJMGy94QhOu3wrPHJ1UIq857weg9CR/Mbg6
 AjkgY/QnpsM8g1UZUHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDAxNiBTYWx0ZWRfX8g8Ji9L9ku29
 RMwFnPKJgmd0gvxQ8HxOHsFuB4Wau6hvxZp1Ez+076S0nlFmWpXDbOGRB2XS9G9wq1erFM7DjkU
 676TKTG9eoQY7/nw3VD8ks9YCcyQ7Dk=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa0b8ab cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gj5R-QuDH20YKR02NA4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090016

Hi Uwe,

On Mon, Sep 07, 2026 at 10:32:55AM +0200, Uwe Kleine-König wrote:
> Hello Shawn,
> 
> On Wed, Sep 02, 2026 at 12:59:38PM +0800, Shawn Guo wrote:
> > +#include <linux/i2c.h>
> > [...]
> > +#include <linux/mod_devicetable.h>
> 
> Please rely on <linux/i2c.h> to provide of_device_id and (see below)
> i2c_device_id. Alternatively include the needed files below
> include/linux/device-id/ to not introduce unneeded dependencies.

Ah, yes! I will drop this include.

> 
> > +static const struct of_device_id fusb15201_of_match[] = {
> > +	{ .compatible = "onnn,fusb15201" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, fusb15201_of_match);
> > +
> > +static struct i2c_driver fusb15201_driver = {
> > +	.driver = {
> > +		.name = "fusb15201",
> > +		.of_match_table = fusb15201_of_match,
> > +	},
> > +	.probe = fusb15201_probe,
> 
> Don't you need an i2c_device_id table, too?

I'm not sure. For the DT case the of_match_table handles both matching
and module autoloading, so nothing is missing there.

The i2c_device_id table would only matter for a client created without a
fwnode, e.g. from board code, and that is not a case the driver supports
or has been tested against. probe() walks the child fwnodes of the device
to find the connectors and fails with -ENODEV when there are none, and
each port needs its Type-C capabilities and a usb-role-switch reference
from firmware. So matching by name alone would only turn a "no driver"
case into a probe failure.  If a platform without DT ever needs this
driver, it has to describe the connectors first, and the i2c_device_id
table can come along with that.

Shawn
